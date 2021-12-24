CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$to_refcursor(IN p_cursor_id INTEGER)
RETURNS REFCURSOR
AS
$function$
DECLARE
    v_cur_metadata JSONB;
    v_curr_row INTEGER;
    v_rows_fetched INTEGER;
    v_coldtype_casts VARCHAR;
    v_colnames_cases VARCHAR;
    v_colnames_list VARCHAR;
    v_resrecset_sql TEXT;
    v_current_user_oid BIGINT;
    v_sql_function_code SMALLINT;
    v_res_refcursor REFCURSOR := format('sct-dbms_sql$cur_id_%s_recset', p_cursor_id);
BEGIN
    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    END IF;

    -- Obtaining current user OID
    v_current_user_oid := aws_oracle_ext.get_user_oid_by_name(current_user);

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    /* Checking that effective user OID (current_user) of the caller on this cursor is the same
       as that of the caller of the most recent parse operation on this cursor.
       Actual for cursors opened with security level 2 */
    IF ((v_cur_metadata ->> 'security_level')::SMALLINT = 2 AND
        (v_cur_metadata ->> 'parse_user_oid')::BIGINT != v_current_user_oid)
    THEN
        RAISE invalid_role_specification;
    END IF;

    -- Getting dynamic SQL function code
    v_sql_function_code := aws_oracle_ext.dbms_sql$last_sql_function_code(p_cursor_id);

    /* Cursor rows count should not be empty (NULL),
       or of type other than SELECT (func_code 4) */
    IF ((v_cur_metadata ->> 'rows_count') IS NULL OR
         v_sql_function_code != 4)
    THEN
        -- ORA-01001: invalid cursor
        RAISE null_value_not_allowed;
    END IF;

    -- Getting num of rows already fetched from DBMS_SQL cursor
    v_rows_fetched := coalesce((v_cur_metadata ->> 'curr_row')::INTEGER, 0);

    BEGIN
        -- Getting column info (list of names, data type casts, column position cases)
        SELECT string_agg(format('CAST("%s" AS %s)',
                                 col_name,
                                 CASE
                                    WHEN data_type IN ('CHARACTER',
                                                       'CHARACTER VARYING')
                                    THEN concat(data_type, '(' || chr_max_len || ')')
                                    WHEN (data_type ~* '^\s*TIME' OR
                                          data_type = 'INTERVAL')
                                    THEN format(CASE data_type
                                                   WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN 'TIMESTAMP(%s) WITHOUT TIME ZONE'
                                                   WHEN 'TIMESTAMP WITH TIME ZONE' THEN 'TIMESTAMP(%s) WITH TIME ZONE'
                                                   WHEN 'TIME WITHOUT TIME ZONE' THEN 'TIME(%s) WITHOUT TIME ZONE'
                                                   WHEN 'TIME WITH TIME ZONE' THEN 'TIME(%s) WITH TIME ZONE'
                                                   ELSE 'INTERVAL(%s)'
                                                END, /* default precision for time fraction is 6 */
                                                coalesce(tstamp_precision, interval_precision, 6))
                                    ELSE data_type
                                 END),
                          concat(',', chr(10), repeat(' ', 7))),
               string_agg(format(concat_ws(chr(10),
                                           '(array_agg(CASE column_pos',
                                           repeat(' ', 28) || 'WHEN %s THEN %s',
                                           repeat(' ', 26) || 'END))[%s]'),
                                 column_pos,
                                 CASE base_type
                                    WHEN 'TEXT' THEN 'chr_val'
                                    WHEN 'NUMERIC' THEN 'num_val'
                                    WHEN 'DOUBLE PRECISION' THEN 'dprec_val'
                                    WHEN 'MONEY' THEN 'money_val'
                                    WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN 'tstamp_val'
                                    WHEN 'TIMESTAMP WITH TIME ZONE' THEN 'tstamptz_val'
                                    WHEN 'TIME WITH TIME ZONE' THEN 'timetz_val'
                                    WHEN 'INTERVAL' THEN 'interval_val'
                                    WHEN 'BOOLEAN' THEN 'bool_val'
                                    WHEN 'XML' THEN 'xml_val'
                                    WHEN 'BYTEA' THEN 'bin_val'
                                 END,
                                 column_pos),
                          concat(',', chr(10), repeat(' ', 15))),
               string_agg(format('"%s"', col_name),
                          concat(',', chr(10), repeat(' ', 24)))
          INTO v_coldtype_casts,
               v_colnames_cases,
               v_colnames_list -- Comma-separated list of column names
          FROM dbms_sql$cursor_column
         WHERE cursor_id = p_cursor_id;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Constructing query to extract data (as dataset) into REFCURSOR
    v_resrecset_sql :=
        format(concat_ws(chr(10),
                   'SELECT ' || v_coldtype_casts,
                   '  FROM (SELECT ' || v_colnames_cases,
                   '          FROM dbms_sql$recordset',
                   '         WHERE cursor_id = %s',
                   '           AND rownum > %s',
                   '         GROUP BY rownum',
                   '       ) AS record_set (%s)'),
               p_cursor_id,
               v_rows_fetched,
               v_colnames_list);

    -- Opening REFCURSOR for dymanic SQL query resulting data
    OPEN v_res_refcursor SCROLL FOR EXECUTE v_resrecset_sql;

    -- Closing the DBMS_SQL cursor and nulling its context
    PERFORM aws_oracle_ext.dbms_sql$close_cursor(p_cursor_id);

    -- Setting `last_row_count` variable
    PERFORM set_config('sct$dbms_sql.last_row_count', v_rows_fetched::TEXT, FALSE);

    RETURN v_res_refcursor;
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- DBMS_SQL cursor rows count is NULL or func_code != 4 (SELECT)
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'Invalid cursor.',
                    DETAIL := 'Dynamic SQL statement was not executed or is not a valid SELECT query.',
                    HINT := '-1001';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql;