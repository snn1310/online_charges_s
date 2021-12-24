CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$execute(IN p_cursor_id INTEGER)
RETURNS NUMERIC
AS
$function$
DECLARE
    v_cur_metadata JSONB;
    v_curcols_data JSONB;
    v_colscount_block TEXT;
    v_colstype_block TEXT;
    v_prepdynsql_block TEXT;
    v_sql_statement TEXT;
    v_cols_count SMALLINT;
    v_cases_list TEXT;
    v_rows_count INTEGER;
    v_vars_sync_sql TEXT;
    v_col_aliases1 TEXT;
    v_col_aliases2 TEXT;
    v_coldtype_cases TEXT;
    v_into_clause TEXT;
    v_bind_var RECORD;
    v_bindvar_val TEXT;
    v_bindvar_col TEXT;
    v_bind_varstr TEXT;
    v_datatypes_rec RECORD;
    v_err_message TEXT;
    v_err_stack TEXT;
    v_defcols_hash TEXT;
    v_sql_cmd_type TEXT;
    v_sql_function_code SMALLINT;
    v_colstype_table_name TEXT;
    v_current_user_oid BIGINT;
    v_debug_mode BOOLEAN := 0; -- {1:ON, 0:OFF}. If set to "ON", engine logs all dynamically generated scripts into `dbms_sql$cursor` table
BEGIN
    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    /* If cursor was transformed from a REFCURSOR
       than it could not be executed */
    IF ((v_cur_metadata ->> 'from_refcursor')::BOOLEAN) THEN
        RAISE invalid_cursor_definition;
    -- Checking that cursor is opened (exit if it is not)
    ELSIF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    END IF;

    -- Obtaining current user OID
    v_current_user_oid := aws_oracle_ext.get_user_oid_by_name(current_user);

    /* Checking that effective user OID (current_user) of the caller on this cursor is the same
       as that of the caller of the most recent parse operation on this cursor.
       Actual for cursors opened with security level 1 and 2 */
    IF ((v_cur_metadata ->> 'security_level')::SMALLINT IN (1, 2) AND
        (v_cur_metadata ->> 'parse_user_oid')::BIGINT != v_current_user_oid)
    THEN
        RAISE invalid_role_specification;
    END IF;

    -- Getting dynamic SQL function code from cursor metadata (JSON)
    v_sql_function_code := (v_cur_metadata ->> 'sql_func_code');

    -- Determining SQL command type from cursor metadata (JSON)
    v_sql_cmd_type := (v_cur_metadata ->> 'sql_cmd_type');

    BEGIN
        -- Getting SQL-PL/pgSQL statement by cursor id
        SELECT rtrim(sql_statement, ';')
          INTO v_sql_statement
          FROM dbms_sql$cursor
         WHERE cursor_id = p_cursor_id;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    /* Associated SQL statement (PL/pgSQL blobk)
       should not be empty (NULL) or invalid (not recognized) */
    IF (coalesce(v_sql_statement, '') = '' OR
        v_sql_cmd_type IS NULL)
    THEN -- ORA-01003: no statement parsed
        RAISE null_value_not_allowed;
    END IF;

    -- Conditional execution by SQL command type
    IF (v_sql_cmd_type = 'DML')
    THEN
        /* Wrapper to resolve an issue with SELECT-INTO statement,
           where INTO clause supplied at the end of the statement string */
        IF (v_sql_statement ~* '^SELECT(.)*FROM(.)*INTO\s*([\$\:][[:alnum:]_]+(,\s*)?)+\s*$' AND
            v_sql_function_code NOT IN (3, 5, 9)) -- INSERT, UPDATE, DELETE
        THEN
            -- Extracting "INTO" clause (and related "$1, $2, $n" markers) from the end of the statement string
            v_into_clause := aws_oracle_ext.regexp_substr(v_sql_statement, '(\s*INTO\s*([\$\:][[:alnum:]_]+(,\s*)?)+)\s*$', 1, 1, 'i');

            -- Removing "INTO" clause from the end of the statement string
            v_sql_statement := replace(v_sql_statement, v_into_clause, '');

            -- Replacing "INTO" with "INTO STRICT" in order to emulate NO_DATA_FOUND & TOO_MANY_ROWS logic
            v_into_clause := regexp_replace(v_into_clause, 'INTO', 'INTO STRICT', 'gi');

            -- Inserting "INTO" clause (and related "$1, $2, $n" markers) before "FROM" clause
            v_sql_statement := overlay(v_sql_statement placing concat(' ', ltrim(v_into_clause))
                                                          from position('FROM' in upper(v_sql_statement)) - 2
                                                           for 1);
        ELSIF (v_sql_statement ~* 'RETURNING' AND
               v_sql_function_code IN (3, 5, 9)) -- INSERT, UPDATE, DELETE
        THEN
            -- Replacing "RETURNING col_name; INTO" with "RETURNING col_name INTO"
            v_sql_statement := regexp_replace(v_sql_statement, '(?:;)\s*INTO', ' INTO', 'gi');
        END IF;

        /* Binding local variables (instead of placeholders)
           associated with dynamic SQL query (PL/pgSQL block) */
        FOR v_bind_var IN
        (SELECT *
           FROM dbms_sql$bind_variable
          WHERE cursor_id = p_cursor_id
          ORDER BY var_pos)
        LOOP
            CASE v_bind_var.base_type
               WHEN 'TEXT' THEN
                   v_bindvar_col := 'chr_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.chr_val IS NOT NULL
                                       THEN quote_literal(CASE v_bind_var.data_type
                                                             WHEN 'CHARACTER' THEN rpad(v_bind_var.chr_val, v_bind_var.value_size, ' ')
                                                             ELSE substring(v_bind_var.chr_val, 1, v_bind_var.value_size)
                                                          END)
                                       ELSE NULL
                                    END;
               WHEN 'NUMERIC' THEN
                   v_bindvar_col := 'num_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.num_val IS NOT NULL
                                       THEN v_bind_var.num_val::TEXT
                                       ELSE NULL
                                    END;
               WHEN 'DOUBLE PRECISION' THEN
                   v_bindvar_col := 'dprec_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.dprec_val IS NOT NULL
                                       THEN v_bind_var.dprec_val::TEXT
                                       ELSE NULL
                                    END;
               WHEN 'MONEY' THEN
                   v_bindvar_col := 'money_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.money_val IS NOT NULL
                                       THEN format('MONEY ''%s''', v_bind_var.money_val::TEXT)
                                       ELSE NULL
                                    END;
               WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
                   v_bindvar_col := 'tstamp_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.tstamp_val IS NOT NULL
                                       THEN CASE v_bind_var.data_type
                                               WHEN 'DATE' THEN format('DATE ''%s''',
                                                                       to_char(v_bind_var.tstamp_val, 'yyyy-mm-dd'))
                                               WHEN 'TIME WITHOUT TIME ZONE' THEN format('TIME ''%s''',
                                                                                         to_char(v_bind_var.tstamp_val, 'hh24:mi:ss.us'))
                                               ELSE format('TIMESTAMP ''%s''',
                                                           to_char(v_bind_var.tstamp_val, 'yyyy-mm-dd hh24:mi:ss.us'))
                                            END
                                       ELSE NULL
                                    END;
               WHEN 'TIMESTAMP WITH TIME ZONE' THEN
                   v_bindvar_col := 'tstamptz_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.tstamptz_val IS NOT NULL
                                       THEN format('TIMESTAMPTZ ''%s''', to_char(v_bind_var.tstamptz_val, 'yyyy-mm-dd hh24:mi:ss.usOF'))
                                       ELSE NULL
                                    END;
               WHEN 'TIME WITH TIME ZONE' THEN
                   v_bindvar_col := 'timetz_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.timetz_val IS NOT NULL
                                       THEN format('TIMETZ ''%s''', v_bind_var.timetz_val::TEXT)
                                       ELSE NULL
                                    END;
               WHEN 'INTERVAL' THEN
                   v_bindvar_col := 'interval_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.interval_val IS NOT NULL
                                       THEN format('INTERVAL ''%s''', v_bind_var.interval_val::TEXT)
                                       ELSE NULL
                                    END;
               WHEN 'BOOLEAN' THEN
                   v_bindvar_col := 'bool_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.bool_val IS NOT NULL
                                       THEN upper(v_bind_var.bool_val::TEXT)
                                       ELSE NULL
                                    END;
               WHEN 'XML' THEN
                   v_bindvar_col := 'xml_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.xml_val IS NOT NULL
                                       THEN quote_literal(v_bind_var.xml_val)
                                       ELSE NULL
                                    END;
               WHEN 'BYTEA' THEN
                   v_bindvar_col := 'bin_val';
                   v_bindvar_val := CASE
                                       WHEN v_bind_var.bin_val IS NOT NULL
                                       THEN format('decode(%s, ''hex'')',
                                                   quote_literal(encode(v_bind_var.bin_val, 'hex')))
                                       ELSE NULL
                                    END;
            ELSE CONTINUE;
            END CASE;

            -- Constructing dynamic block variables declaration
            v_bind_varstr := concat_ws(chr(10),
                                       v_bind_varstr,
                                       format('    v_%s %s%s', -- Variable declaration mask
                                       v_bind_var.var_name, -- Variable name
                                       CASE v_bind_var.data_type
                                          WHEN 'CHARACTER' THEN 'CHARACTER VARYING'
                                          ELSE v_bind_var.data_type
                                       END, -- Variable data type
                                       CASE -- Variable default value
                                          WHEN v_bindvar_val IS NULL THEN ';'
                                          ELSE format(' := %s;', v_bindvar_val)
                                       END));

            -- Replacing all bind ":var_label" labels with proper `outer_block.v_var_name` vars
            v_sql_statement := regexp_replace(v_sql_statement,
                                              ':' || v_bind_var.var_name,
                                              'outer_block.v_' || v_bind_var.var_name,
                                              'gi');

            /* Replacing all bind "$1[|,;-_]$2[|,;-_]$n" markers
               with the corresponding `outer_block.v_var_name` variable */
            IF (v_bind_var.var_label IS NOT NULL) THEN
                v_sql_statement := regexp_replace(v_sql_statement,
                                                  replace(concat('(', v_bind_var.var_label, ')(?!\d)'), '$', '\$'),
                                                  'outer_block.v_' || v_bind_var.var_name,
                                                  'gi');
            END IF;

            -- Generating bind variable (stored in `dbms_sql$bind_variable`) update scripts
            v_vars_sync_sql := concat_ws(chr(10),
                                         v_vars_sync_sql,
                                         '',
                                         format('-- Updating "%s" bind variable value', v_bind_var.var_name),
                                         'UPDATE dbms_sql$bind_variable',
                                         format('   SET %s = %s', v_bindvar_col,
                                                CASE
                                                   WHEN v_bind_var.data_type = 'TIME WITHOUT TIME ZONE'
                                                   THEN format('to_char(outer_block.v_%s, ''2001-01-01 hh24:mi:ss.us'')::TIMESTAMP',
                                                               v_bind_var.var_name)
                                                   ELSE 'outer_block.v_' || v_bind_var.var_name
                                                END),
                                         ' WHERE cursor_id = outer_block.v_cursor_id',
                                         format('   AND var_name = %s;', quote_literal(v_bind_var.var_name)));
        END LOOP;

        -- Getting dynamic SQL statement expected columns count
        v_cols_count := (v_cur_metadata ->> 'cols_count')::INTEGER;

        IF (v_cols_count IS NULL AND -- Columns count variable is NULL
            (v_cur_metadata ->> 'colinfo_refresh')::SMALLINT = 1) -- Columns info needs to be refreshed
        THEN
            IF (v_sql_function_code = 4) THEN -- SELECT function code
                -- Determining the number of columns in dynamic SQL statement
                v_colscount_block :=
                    concat_ws(chr(10),
                        'DO $dbms_sql$',
                        '<<outer_block>>',
                        'DECLARE',
                        '    v_cur_metadata JSONB;',
                        '    v_dynsql_row RECORD;',
                        '    v_cols_count SMALLINT;',
                        format('    v_cursor_id INTEGER := %s;', p_cursor_id),
                        v_bind_varstr, -- Cursor vars declaration
                        'BEGIN',
                        '-- Obtaining dynamic query structure',
                        'SELECT src.*',
                        '  INTO outer_block.v_dynsql_row',
                        '  FROM (',
                        '--------------- Dynamic SQL statement ---------------',
                        v_sql_statement,
                        '--------------- Dynamic SQL statement ---------------',
                        '       ) AS src',
                        ' WHERE 1 = 2;',
                        '',
                        '-- Calculating dymamic sql statement columns count',
                        'SELECT COUNT(1)',
                        '  INTO outer_block.v_cols_count',
                        '  FROM json_object_keys(row_to_json(outer_block.v_dynsql_row));',
                        '',
                        '-- Getting cursor metadata (JSON) object',
                        'outer_block.v_cur_metadata :=',
                        '    nullif(current_setting(format(''sct$dbms_sql.cursor_id_%s_metadata'',',
                        '                                  outer_block.v_cursor_id), TRUE), '''');',
                        '',
                        'outer_block.v_cur_metadata := -- Setting "cols_count" (JSON) cursor property',
                        '    jsonb_set(outer_block.v_cur_metadata, ''{cols_count}'', to_jsonb(outer_block.v_cols_count));',
                        '',
                        '-- Saving cursor metadata (JSON) object',
                        'PERFORM set_config(format(''sct$dbms_sql.cursor_id_%s_metadata'', outer_block.v_cursor_id),',
                        '                   outer_block.v_cur_metadata::TEXT, -- cursor metadata object',
                        '                   FALSE);',
                        'END; $dbms_sql$');

                EXECUTE v_colscount_block; -- Will be saved into `dbms_sql$cursor` ("colscount_block" column) if "v_debug_mode" set to "ON" (1)

                -- Getting updated cursor metadata (JSON) object
                v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

                -- Getting dynamic SQL statement updated columns count
                v_cols_count := (v_cur_metadata ->> 'cols_count')::INTEGER;
            ELSE v_cols_count := 0;
            END IF;
        END IF;

        /* Dynsql execution SELECT (v_cols_count > 0, results in rowset)
           or PL/pgSQL anonymous block (v_cols_count = 0 or is NULL) */
        IF (v_cols_count > 0) THEN
            -- Generating list of consecutive column aliases (col_1, col_2, ...)
            SELECT string_agg(concat(repeat(' ', 10), 'col_', colnum),
                              concat(',', chr(10))),
                   string_agg(concat(repeat(' ', 28), 'col_', colnum),
                              concat(',', chr(10)))
              INTO v_col_aliases1,
                   v_col_aliases2
              FROM generate_series(1, v_cols_count) AS colnum;

            -- Refresh cursor columns data type info only if SQL statement was changed
            IF ((v_cur_metadata ->> 'colinfo_refresh')::SMALLINT = 1) THEN
                -- Generating unique temp table name
                v_colstype_table_name :=
                    format('dynsql_colstype_%s',
                           lower(substring((SELECT string_agg(md5(random()::TEXT), '')
                                              FROM generate_series(1, ceil(14 / 32.)::INTEGER)
                                           ), 1, 14)));

                -- Determining data type of columns in dynamic SQL statement
                v_colstype_block :=
                    concat_ws(chr(10),
                        'DO $dbms_sql$',
                        '<<outer_block>>',
                        'DECLARE',
                        format('    v_cursor_id INTEGER := %s;', p_cursor_id),
                        v_bind_varstr, -- Cursor vars declaration
                        'BEGIN',
                        '-- Deleting previous dynamic sql execution results',
                        'DELETE FROM dbms_sql$recordset',
                        '      WHERE cursor_id = outer_block.v_cursor_id;',
                        '',
                        '-- Deleting previous dynamic sql columns info',
                        'DELETE FROM dbms_sql$cursor_column',
                        '      WHERE cursor_id = outer_block.v_cursor_id;',
                        '',
                        '-- Creating temp table in order to reflect the columns structure',
                        'BEGIN',
                        format('CREATE TEMP TABLE %s', v_colstype_table_name),
                        'WITH (OIDS = FALSE)',
                        'ON COMMIT DROP',
                        'AS',
                        'SELECT src.* FROM (',
                        '--------------- Dynamic SQL statement ---------------',
                        v_sql_statement, -- Dynamic SQL statement where placeholders replaced with v_block vars
                        '--------------- Dynamic SQL statement ---------------',
                        ') AS src',
                        'WITH NO DATA;', -- Obtaining only dynamic query structure
                        '',
                        '/* Using column aliases instead of names',
                        '   in case if any duplicate columns found */',
                        'EXCEPTION',
                        'WHEN duplicate_column THEN',
                        '',
                        format('CREATE TEMP TABLE %s', v_colstype_table_name),
                        'WITH (OIDS = FALSE)',
                        'ON COMMIT DROP',
                        'AS',
                        'SELECT src.* FROM (',
                        '--------------- Dynamic SQL statement ---------------',
                        v_sql_statement, -- Dynamic SQL statement where placeholders replaced with v_block vars
                        '--------------- Dynamic SQL statement ---------------',
                        format(') AS src (%s)', trim(v_col_aliases1)), -- Consecutive column aliases list
                        'WITH NO DATA;', -- Get only dynamic query structure
                        'END;',
                        '',
                        concat_ws(chr(10), '-- Saving detailed column data (name, type, precision, etc.)',
                        'INSERT INTO dbms_sql$cursor_column (cursor_id,',
                        '                                    column_pos,',
                        '                                    col_name,',
                        '                                    data_type,',
                        '                                    base_type,',
                        '                                    is_nullable,',
                        '                                    chr_max_len,',
                        '                                    chr_byte_len,',
                        '                                    num_precision,',
                        '                                    num_scale,',
                        '                                    tstamp_precision,',
                        '                                    interval_type,',
                        '                                    interval_precision)',
                        'SELECT outer_block.v_cursor_id,',
                        '       ordinal_position,',
                        '       column_name,',
                        '       upper(data_type),',
                        '       aws_oracle_ext.get_base_type_by_dtype(upper(data_type)),',
                        '       CASE is_nullable',
                        '          WHEN ''YES'' THEN TRUE',
                        '          ELSE FALSE',
                        '       END,',
                        '       character_maximum_length,',
                        '       character_octet_length,',
                        '       numeric_precision,',
                        '       numeric_scale,',
                        '       datetime_precision,',
                        '       interval_type,',
                        '       interval_precision',
                        '  FROM information_schema.columns'),
                        format(' WHERE table_name = ''%s''', v_colstype_table_name),
                        ' ORDER BY ordinal_position ASC;',
                        '',
                        '-- Dropping temp table since its not needed anymore',
                        format('DROP TABLE %s;', v_colstype_table_name),
                        'END; $dbms_sql$');

                EXECUTE v_colstype_block; -- Will be saved into `dbms_sql$cursor` ("colstype_block" column) if "v_debug_mode" set to "ON" (1)

                -- Serializing dynamic statement columns data into JSON object
                SELECT jsonb_object_agg(concat('col_', curcol_data.column_pos),
                                        curcol_data.column_data)
                  INTO v_curcols_data
                  FROM (SELECT curcol3.column_pos,
                               (SELECT to_jsonb(curcol2.*)
                                  FROM (SELECT curcol1.data_type,
                                               curcol1.base_type,
                                               curcol1.chr_max_len,
                                               curcol1.chr_byte_len
                                          FROM dbms_sql$cursor_column AS curcol1
                                         WHERE curcol1.cursor_id = curcol3.cursor_id
                                           AND curcol1.column_pos = curcol3.column_pos
                                       ) AS curcol2
                               ) AS column_data
                          FROM dbms_sql$cursor_column AS curcol3
                         WHERE curcol3.cursor_id = p_cursor_id
                       ) AS curcol_data;

                -- Setting "curcols_data" (JSON) cursor property
                v_cur_metadata := jsonb_set(v_cur_metadata, '{curcols_data}', v_curcols_data);

                -- Setting "colinfo_refresh" (JSON) cursor property
                v_cur_metadata := jsonb_set(v_cur_metadata, '{colinfo_refresh}', to_jsonb(0));
            END IF;

            -- Getting defined columns data hash
            v_defcols_hash := md5(v_cur_metadata ->> 'defcols_data');

            IF (v_defcols_hash IS NOT NULL AND
                v_defcols_hash != coalesce(v_cur_metadata ->> 'defcols_hash', ''))
            THEN
                -- Setting "defcols_hash" (JSON) cursor property
                v_cur_metadata := jsonb_set(v_cur_metadata, '{defcols_hash}', to_jsonb(v_defcols_hash));

                /* Checking for correspondence between actual and declared column base data types.
                   Oracle ORA-00932: INCONSISTENT_TYPE error is raised if the type of the given OUT parameter
                   value is different from the actual type of the value.

                   This type was given when the column was defined by calling `dbms_sql$define_column` procedure.
                */
                FOR v_datatypes_rec IN
                (SELECT curcol.column_pos,
                        curcol.data_type AS cur_data_type,
                        curcol.base_type AS cur_base_type,
                        defcol.data_type AS def_data_type,
                        defcol.base_type AS def_base_type
                   FROM dbms_sql$cursor_column AS curcol
                        INNER JOIN dbms_sql$define_column AS defcol ON (defcol.cursor_id = curcol.cursor_id AND
                                                                        defcol.column_pos = curcol.column_pos AND
                                                                        (defcol.base_type != curcol.base_type OR
                                                                         (substring(curcol.data_type, 1, 5) = 'TIME ' AND
                                                                          defcol.base_type = 'TIMESTAMP WITHOUT TIME ZONE') OR
                                                                         (substring(defcol.data_type, 1, 5) = 'TIME ' AND
                                                                          curcol.base_type = 'TIMESTAMP WITHOUT TIME ZONE')) AND
                                                                        coalesce(defcol.is_fixed, 0) != 1)
                  WHERE curcol.cursor_id = p_cursor_id)
                LOOP
                    /* Next data types are not implicitly convertible:
                       - TIMESTAMP WITHOUT TIME ZONE to TIMESTAMP WITH TIME ZONE (and vice versa)
                       - TIME WITHOUT TIME ZONE to TIME WITH TIME ZONE (and vice versa)
                       - NUMERIC to DOUBLE PRECISION (and vice versa)

                       Thus, they must not generate an INCONSISTENT_TYPE error since they could be
                       explicitly casted to each other with `dbms_sql$column_value` function
                    */
                    CONTINUE WHEN substring(v_datatypes_rec.cur_data_type, 1, 14) = substring(v_datatypes_rec.def_data_type, 1, 14) OR -- TIMESTAMPs
                                  substring(v_datatypes_rec.cur_data_type, 1, 5) = substring(v_datatypes_rec.def_data_type, 1, 5) OR -- TIMEs
                                  (v_datatypes_rec.cur_base_type IN ('NUMERIC',
                                                                     'DOUBLE PRECISION') AND
                                   v_datatypes_rec.def_base_type IN ('NUMERIC',
                                                                     'DOUBLE PRECISION')) OR
                                  ((v_datatypes_rec.cur_data_type = 'DATE' AND
                                    v_datatypes_rec.def_base_type = 'TIMESTAMP WITH TIME ZONE') OR
                                   (v_datatypes_rec.def_data_type = 'DATE' AND
                                    v_datatypes_rec.cur_base_type = 'TIMESTAMP WITH TIME ZONE'));

                    -- Inconsistent datatypes (Oracle error 'ORA-00932')
                    RAISE datatype_mismatch;
                END LOOP;
            END IF;

            /* Constructing CASEs to distribute dynamic query execution results
               through INSERT-SELECT into `dbms_sql$recordset` table */
            WITH dtypes_order AS
            (SELECT 'TEXT' AS base_type, 1 AS dtype_order
              UNION ALL
             SELECT 'NUMERIC', 2
              UNION ALL
             SELECT 'DOUBLE PRECISION', 3
              UNION ALL
             SELECT 'MONEY', 4
              UNION ALL
             SELECT 'TIMESTAMP WITHOUT TIME ZONE', 5
              UNION ALL
             SELECT 'TIMESTAMP WITH TIME ZONE', 6
              UNION ALL
             SELECT 'TIME WITH TIME ZONE', 7
              UNION ALL
             SELECT 'INTERVAL', 8
              UNION ALL
             SELECT 'BOOLEAN', 9
              UNION ALL
             SELECT 'XML', 10
              UNION ALL
             SELECT 'BYTEA', 11),
            -- Attaching current columns data
            curcols_data AS
            (SELECT base_type,
                    array_agg(concat_ws(':', column_pos, data_type)) AS colpos_list
               FROM dbms_sql$cursor_column
              WHERE cursor_id = p_cursor_id
              GROUP BY base_type)

            SELECT string_agg(
                   coalesce('       CASE colpos' || chr(10) ||
                   (SELECT string_agg(format('          WHEN %s THEN %s',
                                             colpos,
                                             CASE dtype
                                                WHEN 'TIME WITHOUT TIME ZONE' -- List of types that require special conversion
                                                THEN format('to_char(col_%s, ''2001-01-01 hh24:mi:ss.us'')::TIMESTAMP', colpos)
                                                ELSE 'col_' || colpos
                                             END),
                                      chr(10))
                      FROM (SELECT substring(colpos, '^(\d+):?') AS colpos,
                                   substring(colpos, ':(.+)$') AS dtype
                              FROM unnest(cdt.colpos_list) AS colpos) AS cols) || chr(10) || '       END',
                                       '       NULL'),
                   ',' || chr(10) ORDER BY dto.dtype_order ASC)
              INTO v_coldtype_cases
              FROM dtypes_order dto
                   LEFT JOIN curcols_data cdt ON (cdt.base_type = dto.base_type);

            /* Constructing INSERT-SELECT (into `dbms_sql$recordset` table),
               required to distribute dynamic query execution results */
            v_sql_statement :=
                concat_ws(chr(10),
                    '-- Deleting previous dynamic SQL execution results',
                    'DELETE FROM dbms_sql$recordset',
                    '      WHERE cursor_id = outer_block.v_cursor_id;',
                    '',
                    '/* Execution of dynamic SQL statement and inserting its',
                    '   resulting data into temp table dbms_sql$recordset */',
                    'INSERT INTO dbms_sql$recordset (cursor_id,',
                    '                                rownum,',
                    '                                column_pos,',
                    '                                chr_val,',
                    '                                num_val,',
                    '                                dprec_val,',
                    '                                money_val,',
                    '                                tstamp_val,',
                    '                                tstamptz_val,',
                    '                                timetz_val,',
                    '                                interval_val,',
                    '                                bool_val,',
                    '                                xml_val,',
                    '                                bin_val)',
                    'SELECT outer_block.v_cursor_id,',
                    '       rownum,',
                    '       colpos,',
                    v_coldtype_cases, -- Coltypes distribution CASEs
                    '  FROM (SELECT row_number() over (order by 1) AS rownum,',
                    '               generate_series(1, outer_block.v_cols_count) AS colpos,',
                    '               dynsql.*',
                    '          FROM (',
                    '--------------- Dynamic SQL statement ---------------',
                    v_sql_statement, -- Dynamic SQL statement
                    '--------------- Dynamic SQL statement ---------------',
                    format('               ) AS dynsql (%s)', trim(v_col_aliases2)), -- List of consecutive column aliases
                    '       ) AS dynsql2;');
        END IF;

        -- Removing "$$" and "LANGUAGE" markers in order to embed block into <<outer_block>>
        IF (v_sql_function_code = 34) -- PL/SQL (PL/pgSQL) block function code
        THEN
            -- Removing "$$" and "LANGUAGE" markers from the start of the statement
            v_sql_statement := regexp_replace(v_sql_statement,
                '(^\s*DO(:?\s+LANGUAGE\s+[[:alnum:]]+\s+)?\s*\$(\w*)?\$\s*(:?<<.+>>)?\s*)',
                concat(substring(v_sql_statement, '<<.+>>'), chr(10)), 'gi');

            -- Removing "$$" and "LANGUAGE" markers from the end of the statement
            v_sql_statement := regexp_replace(v_sql_statement,
                '(END\s*(;)?\s*\$(\w*)?\$\s*(:?\s+LANGUAGE\s+[[:alnum:]]+)?\s*$)', 'END;', 'gi');

            -- Removing any unnecessary blank strings (spaces) from the beginning and the end of SQL statement
            v_sql_statement := regexp_replace(v_sql_statement, '^\s*(?=\S*)|(?<=\S*)\s*$', '', 'gi');
        END IF;

        -- Saving cursor metadata (JSON) object
        PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id),
                           v_cur_metadata::TEXT, -- cursor metadata object
                           FALSE);

        IF (v_sql_function_code = 27) -- EXPLAIN
        THEN
            -- Creating special `explain_plan` bind variable to store query EXPLAIN plan
            PERFORM aws_oracle_ext.dbms_sql$bind_variable(p_cursor_id, 'explain_plan', ''::TEXT,
                                                          p_check_var_exists => FALSE);

            -- Dynamic EXPLAIN plan execution wrapper
            v_prepdynsql_block :=
                concat_ws(chr(10),
                    'DO $dbms_sql$',
                    '<<outer_block>>',
                    'DECLARE',
                    '    v_exp_plan TEXT;',
                    '    v_exp_plan_arr TEXT[];',
                    '    r_explain_plan RECORD;',
                    format('    v_cursor_id INTEGER := %s;', p_cursor_id),
                    v_bind_varstr, -- Cursor vars declaration
                    'BEGIN',
                    'FOR r_explain_plan IN',
                    '----------- Dynamic EXPLAIN plan statement -----------',
                    v_sql_statement, -- Dynamic EXPLAIN statement, placeholders replaced with v_block vars
                    '----------- Dynamic EXPLAIN plan statement -----------',
                    'LOOP',
                    '    v_exp_plan_arr := array_append(v_exp_plan_arr, r_explain_plan."QUERY PLAN");',
                    'END LOOP;',
                    '',
                    '-- Updating "explain_plan" bind variable value',
                    'UPDATE dbms_sql$bind_variable',
                    '   SET chr_val = array_to_string(v_exp_plan_arr, chr(10))',
                    ' WHERE cursor_id = outer_block.v_cursor_id',
                    '   AND var_name = ''explain_plan'';',
                    'END; $dbms_sql$');
        ELSE
            -- Dynamic PL/pgSQL block (or DML with INTO clause) execution wrapper
            v_prepdynsql_block :=
                concat_ws(chr(10),
                    'DO $dbms_sql$',
                    '<<outer_block>>',
                    'DECLARE',
                    '    v_cur_metadata JSONB;',
                    '    v_rows_count INTEGER;',
                    format('    v_cols_count SMALLINT := %s;', v_cols_count),
                    format('    v_cursor_id INTEGER := %s;', p_cursor_id),
                    v_bind_varstr, -- Cursor vars declaration
                    'BEGIN',
                    '------- Dynamic PL/pgSQL block (SQL statement) -------',
                    concat(v_sql_statement, -- Dynamic SQL or PL/pgSQL statement, placeholders replaced with v_block vars
                    CASE 
                       WHEN v_sql_statement !~ ';$' THEN ';'
                    END),
                    '------- Dynamic PL/pgSQL block (SQL statement) -------',
                    '',
                    'GET DIAGNOSTICS outer_block.v_rows_count := ROW_COUNT;', -- Count of rows affected by dynamic query execution
                    '',
                    '-- Getting cursor metadata (JSON) object',
                    'outer_block.v_cur_metadata :=',
                    '    nullif(current_setting(format(''sct$dbms_sql.cursor_id_%s_metadata'',',
                    '                                  outer_block.v_cursor_id), TRUE), '''');',
                    '',
                    '-- Setting "rows_count" (JSON) cursor property',
                    'outer_block.v_cur_metadata :=',
                    '    jsonb_set(outer_block.v_cur_metadata,',
                    '              ''{rows_count}'',',
                    '              CASE outer_block.v_cols_count',
                    '                 WHEN 0 THEN to_jsonb(outer_block.v_rows_count)',
                    '                 ELSE to_jsonb(outer_block.v_rows_count / outer_block.v_cols_count)',
                    '              END);',
                    '',
                    '-- Setting "curr_row" (JSON) cursor property',
                    'outer_block.v_cur_metadata := jsonb_set(outer_block.v_cur_metadata, ''{curr_row}'', JSONB ''null'');',
                    '',
                    '-- Saving cursor metadata (JSON) object',
                    'PERFORM set_config(format(''sct$dbms_sql.cursor_id_%s_metadata'', outer_block.v_cursor_id),',
                    '                   outer_block.v_cur_metadata::TEXT, -- cursor metadata object',
                    '                   FALSE);',
                    v_vars_sync_sql, -- Update `dbms_sql$bind_variable` table with new values for binded vars
                    'END; $dbms_sql$');
        END IF;

        EXECUTE v_prepdynsql_block; -- Will be saved into `dbms_sql$cursor` ("prepdynsql_block" column) if "v_debug_mode" set to "ON" (1)

        /* Logging of all dynamically generated scripts
           into `dbms_sql$cursor` if "v_debug_mode" set to "ON" (1) */
        IF (v_debug_mode) THEN
            UPDATE dbms_sql$cursor
               SET colscount_block = coalesce(v_colscount_block, colscount_block),
                   colstype_block = coalesce(v_colstype_block, colstype_block),
                   prepdynsql_block = v_prepdynsql_block
             WHERE cursor_id = p_cursor_id;
        END IF;
    ELSIF (v_sql_cmd_type = 'SCL')
    THEN -- Skipping DDL, DCL, TCL, SCS
        EXECUTE v_sql_statement;
    END IF;

    -- Setting `last_affected_cursor_id` variable
    PERFORM set_config('sct$dbms_sql.last_affected_cursor_id', p_cursor_id::TEXT, FALSE);

    -- Nulling `last_row_count` variable
    PERFORM set_config('sct$dbms_sql.last_row_count', NULL, FALSE);

    -- Getting updated cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    RETURN coalesce((v_cur_metadata ->> 'rows_count')::NUMERIC, 0);
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Trying to execute a REFCURSOR-sourced cursor
    WHEN invalid_cursor_definition THEN
        RAISE USING MESSAGE := 'Invalid cursor.',
                    DETAIL := 'Can not repeatedly execute a REFCURSOR-sourced cursor.',
                    HINT := '-1001';

    -- Associated SQL statement is empty (NULL) or invalid
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'No statement parsed.',
                    DETAIL := 'No valid SQL statement associated with DBMS_SQL cursor.',
                    HINT := '-1003';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';

    -- Actual and declared base data types of a column do not match
    WHEN datatype_mismatch THEN
        RAISE USING MESSAGE := format('Inconsistent datatypes: expected %s got %s.',
                                      v_datatypes_rec.def_data_type,
                                      v_datatypes_rec.cur_data_type),
                    DETAIL := format('Actual and declared data types for column in position %s do not match.',
                                     v_datatypes_rec.column_pos),
                    HINT := '-932';

    -- Undefined parameter in dynamic SELECT statement
    WHEN undefined_parameter THEN
        IF (v_sql_function_code = 4) -- SELECT
        THEN
            -- Not all variables bound
            RAISE USING MESSAGE := 'Not all variables bound.',
                        DETAIL := 'SQL statement (PL/pgSQL block) containing bind variables was attempted to execute without all variables bound.',
                        HINT := '-1008';
        ELSE RAISE;
        END IF;

    -- Some syntax error occurred
    WHEN syntax_error THEN
        GET STACKED DIAGNOSTICS
            v_err_message = MESSAGE_TEXT,
            v_err_stack = PG_EXCEPTION_CONTEXT;

        IF ((v_err_message ~* '^syntax error at or near ":|\$\d+"$' OR
             v_err_message ~* '^"\$\d+" is not a known variable$') AND
             v_sql_cmd_type IN ('DML', 'SCL'))
        THEN
            IF (v_sql_cmd_type = 'DML')
            THEN
                -- Not all variables bound
                RAISE USING MESSAGE := 'Not all variables bound.',
                            DETAIL := 'SQL statement (PL/pgSQL block) containing bind variables was attempted to execute without all variables bound.',
                            HINT := '-1008';
            ELSIF (v_sql_cmd_type = 'SCL')
            THEN
                -- Bind variables not allowed for SCL
                RAISE USING MESSAGE := 'Bind variables not allowed for SCL operations.',
                            DETAIL := 'Bind variables are not allowed for session control language operations.',
                            HINT := '-1027';
            END IF;
        ELSIF (v_sql_function_code = 27) -- EXPLAIN
        THEN
            -- Invalid EXPLAIN statement
            RAISE USING MESSAGE := 'EXPLAIN statement is not valid.',
                        DETAIL := 'EXPLAIN statement contains syntax or execution errors.',
                        HINT := 'Correct the statement and try to perform `dbms_sql$execute` procedure again.';
        ELSE
            RAISE USING MESSAGE := 'Syntax error has occured while trying to execute dynamic SQL statement.',
                        DETAIL := concat(v_err_message, '.'),
                        HINT := concat_ws(chr(10), '(Call Stack)', v_err_stack);
        END IF;
END;
$function$
LANGUAGE plpgsql;