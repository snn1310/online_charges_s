CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$parse(IN p_cursor_id INTEGER,
                                                         IN p_sql_statement TEXT,
                                                         IN p_cols_count INTEGER DEFAULT NULL)
RETURNS VOID
AS
$function$
DECLARE
    v_err_message TEXT;
    v_sql_cmd_type TEXT;
    v_cur_metadata JSONB;
    v_sql_statement TEXT;
    v_statement_hash TEXT;
    v_current_user_oid BIGINT;
    v_sql_function_code SMALLINT;
BEGIN
    v_sql_statement := trim(p_sql_statement);

    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    ELSIF (coalesce(p_sql_statement, '') = '') THEN
        -- ORA-06561: given statement is not supported by package DBMS_SQL
        RAISE sql_statement_not_yet_complete;
    END IF;

    -- Calculating unique statement hash
    v_statement_hash := coalesce(md5(v_sql_statement), '');

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    -- Getting dynamic SQL function code from cursor metadata (JSON)
    v_sql_function_code := (v_cur_metadata ->> 'sql_func_code');

    -- Determining SQL command type from cursor metadata (JSON)
    v_sql_cmd_type := (v_cur_metadata ->> 'sql_cmd_type');

    -- Setting SELECT statement columns count (if passed in)
    v_cur_metadata := jsonb_set(v_cur_metadata, '{cols_count}', coalesce(to_jsonb(p_cols_count), JSONB 'null'));

    -- If cursor (cursor_id) was transformed from a REFCURSOR then remove "from_refcursor" flag
    IF ((v_cur_metadata ->> 'from_refcursor')::BOOLEAN) THEN
        -- Setting "from_refcursor" cursor property to FALSE
        v_cur_metadata := jsonb_set(v_cur_metadata, '{from_refcursor}', JSONB 'false');
    END IF;

    -- Updating cursor info refresh flags if statement is a new one
    IF (v_statement_hash <> coalesce(v_cur_metadata ->> 'statement_hash', ''))
    THEN
        -- Setting "statement_hash" (JSON) cursor property
        v_cur_metadata := jsonb_set(v_cur_metadata, '{statement_hash}', to_jsonb(v_statement_hash));

        -- Setting "colinfo_refresh" (JSON) cursor property
        v_cur_metadata := jsonb_set(v_cur_metadata, '{colinfo_refresh}', to_jsonb(1));

        /* Removing comments from SQL statement (both single and multi-line),
           validating multi-line comment opening and closure tags */
        v_sql_statement := aws_oracle_ext.strip_sql_comments(v_sql_statement,
                                                             p_adv_quote_tags => ARRAY['$q$','$Q$'], -- advanced quoting marker list
                                                             p_validate_multiline => TRUE);
        BEGIN
            -- Associating SQL statement with cursor id
            UPDATE dbms_sql$cursor
               SET sql_statement = v_sql_statement
             WHERE cursor_id = p_cursor_id;
        EXCEPTION
            WHEN insufficient_privilege THEN
                -- Effective userid changed
                RAISE invalid_cursor_state;
        END;

        -- Getting dynamic SQL function code
        v_sql_function_code := aws_oracle_ext.dbms_sql$last_sql_function_code(p_cursor_id);

        -- Determining SQL command type (DDL, DML, DCL, TCL, SCL, SCS) by function code
        v_sql_cmd_type := aws_oracle_ext.get_cmd_type_by_sql_func_code(v_sql_function_code);

        -- Checking SQL statement for correctness
        IF (v_sql_cmd_type IS NULL) THEN
            -- ORA-00900: invalid SQL statement
            RAISE invalid_sql_statement_name;
        END IF;
    END IF;

    /* DDL and DCL statements are executed when they are parsed
       and the function DBMS_SQL.EXECUTE need not be used on them.

       Command type execution map:
       ---------------------------
       DDL - PARSE (DBMS_SQL.PARSE)
       DML - EXECUTE (DBMS_SQL.EXECUTE)
       DCL - PARSE
       TCL - EXECUTE
       SCL - EXECUTE
       SCS - EXECUTE
    */
    IF (v_sql_cmd_type IN ('DDL', 'DCL'))
    THEN
        BEGIN
            EXECUTE v_sql_statement;
        EXCEPTION
            WHEN undefined_parameter THEN
                -- ORA-01027: bind variables not allowed for DDL / DCL
                RAISE invalid_prepared_statement_definition;
            WHEN syntax_error THEN
                GET STACKED DIAGNOSTICS v_err_message = MESSAGE_TEXT;

                -- ORA-01027: bind variables not allowed for DDL / DCL
                IF (v_err_message = 'syntax error at or near ":"')
                THEN
                    RAISE invalid_prepared_statement_definition;
                ELSE
                    -- SQL statement is not valid (with desc.)
                    RAISE invalid_sql_statement_name;
                END IF;
        END;
    END IF;

    -- Setting `last_parsed_cursor_id` variable value
    PERFORM set_config('sct$dbms_sql.last_parsed_cursor_id', p_cursor_id::TEXT, FALSE);

    -- Setting `sql_func_code` (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{sql_func_code}', to_jsonb(v_sql_function_code));

    -- Setting `sql_cmd_type` (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{sql_cmd_type}', to_jsonb(v_sql_cmd_type));

    -- Obtaining current user OID
    v_current_user_oid := aws_oracle_ext.get_user_oid_by_name(current_user);

    -- Setting `parse_role_oid` (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{parse_user_oid}', to_jsonb(v_current_user_oid));

    -- Saving cursor metadata (JSON) object
    PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id),
                       v_cur_metadata::TEXT, -- cursor metadata object
                       FALSE);
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- SQL statement is empty
    WHEN sql_statement_not_yet_complete THEN
        RAISE USING MESSAGE := 'Given statement is not supported by package DBMS_SQL.',
                    DETAIL := 'Attempting to parse an unsupported SQL statement.',
                    HINT := '-6561';

    -- SQL statement is not valid
    WHEN invalid_sql_statement_name THEN
        RAISE USING MESSAGE := 'Invalid SQL statement.',
                    DETAIL := 'The statement is not recognized as a valid SQL statement or PL/pgSQL block.',
                    HINT := '-900';

    -- Bind variables not allowed for DDL / DCL
    WHEN invalid_prepared_statement_definition THEN
        RAISE USING MESSAGE := 'Bind variables not allowed for data definition operations.',
                    DETAIL := 'Bind variables are not allowed for both DDL and DCL operations.',
                    HINT := '-1027';
END;
$function$
LANGUAGE plpgsql;