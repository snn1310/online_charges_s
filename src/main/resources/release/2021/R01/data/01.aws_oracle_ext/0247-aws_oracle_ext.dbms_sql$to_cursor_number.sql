CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$to_cursor_number(IN p_refcursor REFCURSOR)
RETURNS INTEGER
AS
$function$
DECLARE
    v_cur_metadata JSONB;
    v_curcols_data JSONB;
    v_cursor_id INTEGER;
    v_sql_statement TEXT;
    v_cols_count SMALLINT;
    v_col_names1 TEXT;
    v_col_names2 TEXT;
    v_col_aliases TEXT;
    v_colstype_block TEXT;
    v_prepdynsql_block TEXT;
    v_coldtype_cases TEXT;
    v_err_message TEXT;
    v_err_stack TEXT;
    v_refcur_rec RECORD;
    v_refcur_rec_json JSONB;
    v_is_scrollable BOOLEAN;
    v_last_row_count INTEGER;
    v_colstype_table_name TEXT;
    v_debug_mode SMALLINT := 0; -- {1:ON, 0:OFF}. If set to "ON", engine logs all dynamically generated scripts into `dbms_sql$cursor` table
BEGIN
    -- Extracting REFRUCSOR metadata
    BEGIN
        SELECT statement,
               is_scrollable
          INTO STRICT
               v_sql_statement,
               v_is_scrollable
          FROM pg_catalog.pg_cursors
         WHERE name = p_refcursor::TEXT;
    EXCEPTION
        WHEN OTHERS THEN
        -- ORA-01001: invalid cursor
        RAISE invalid_cursor_state;
    END;

    -- Getting `last_row_count` variable value
    v_last_row_count := nullif(current_setting('sct$dbms_sql.last_row_count', TRUE), '');

    /* Fetching row into record from REFCURSOR
       in order to determine columns count */
    IF (v_is_scrollable) THEN
        FETCH NEXT
         FROM p_refcursor
         INTO v_refcur_rec;

        MOVE BACKWARD
        FROM p_refcursor;
    ELSE
        FETCH FIRST
         FROM p_refcursor
         INTO v_refcur_rec;
    END IF;

    -- Getting REFCURSOR columns count
    SELECT COUNT(1)
      INTO v_cols_count
      FROM json_object_keys(row_to_json(v_refcur_rec));

    -- Opening new DBMS_SQL cursor for data storage
    v_cursor_id := aws_oracle_ext.dbms_sql$open_cursor();

    -- Assigning SQL statement and exact columns count to DBMS_SQL cursor
    PERFORM aws_oracle_ext.dbms_sql$parse(v_cursor_id, v_sql_statement, v_cols_count);

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', v_cursor_id), TRUE), '');

    -- Generating list of column names
    SELECT string_agg(format('outer_block.v_refcur_rec."%s"', colname),
                      concat(',', chr(10), repeat(' ', 7))),
           string_agg(format('      outer_block.v_refcur_rec."%s"', colname),
                      concat(',', chr(10)))
      INTO v_col_names1,
           v_col_names2
      FROM json_object_keys(row_to_json(v_refcur_rec)) AS colname;

    -- Generating unique temp table name
    v_colstype_table_name :=
        format('dynsql_colstype_%s',
               lower(substring((SELECT string_agg(md5(random()::TEXT), '')
                                  FROM generate_series(1, ceil(14 / 32.)::INTEGER)
                               ), 1, 14)));

    -- Determining REFCURSOR column data types
    v_colstype_block :=
        concat_ws(chr(10),
            'DO $dbms_sql$',
            '<<outer_block>>',
            'DECLARE',
            '    v_refcur_rec RECORD;',
            format('    v_cursor_id INTEGER := %s;', v_cursor_id),
            format('    v_is_scrollable BOOLEAN := %s;',
            CASE
               WHEN v_is_scrollable THEN 'TRUE'
               ELSE 'FALSE'
            END),
            format('    v_refcursor REFCURSOR := %s;', quote_literal(p_refcursor)),
            'BEGIN',
            '-- Fetching row into RECORD variable',
            'IF (outer_block.v_is_scrollable) THEN',
            '    FETCH NEXT',
            '     FROM outer_block.v_refcursor',
            '     INTO outer_block.v_refcur_rec;',
            '',
            '    MOVE BACKWARD',
            '    FROM outer_block.v_refcursor;',
            'ELSE',
            '    FETCH FIRST',
            '     FROM outer_block.v_refcursor',
            '     INTO outer_block.v_refcur_rec;',
            'END IF;',
            '',
            '-- Creating temp table in order to reflect the columns structure',
            format('CREATE TEMP TABLE %s', v_colstype_table_name),
            'WITH (OIDS = FALSE)',
            'ON COMMIT DROP',
            'AS',
            concat('SELECT ', v_col_names1),
            'WITH NO DATA;',
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

    EXECUTE v_colstype_block; -- Will be saved into `dbms_sql$cursor` table if "v_debug_mode" is set to "ON" (1)

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
             WHERE curcol3.cursor_id = v_cursor_id
           ) AS curcol_data;

    -- Setting `curcols_data` (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{curcols_data}', v_curcols_data);

    -- Setting `from_refcursor` (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{from_refcursor}', JSONB 'true');

    -- Saving cursor metadata (JSON) object
    PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', v_cursor_id),
                       v_cur_metadata::TEXT, -- cursor metadata object
                       FALSE);

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
       WHERE cursor_id = v_cursor_id
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

    -- Generating list of consecutive column aliases (col_1, col_2, ...)
    SELECT string_agg(concat(repeat(' ', 29), 'col_', colnum),
                      concat(',', chr(10)))
      INTO v_col_aliases
      FROM generate_series(1, v_cols_count) AS colnum;

    -- Distributing REFRUCSOR data into `dbms_sql$recordset` table
    v_prepdynsql_block :=
        concat_ws(chr(10),
            'DO $dbms_sql$',
            '<<outer_block>>',
            'DECLARE',
            '    v_cur_metadata JSONB;',
            '    v_refcur_rec RECORD;',
            format('    v_cursor_id INTEGER := %s;', v_cursor_id),
            format('    v_cols_count SMALLINT := %s;', v_cols_count),
            '    v_rows_fetched INTEGER := 0;',
            format('    v_is_scrollable BOOLEAN := %s;',
            CASE
               WHEN v_is_scrollable THEN 'TRUE'
               ELSE 'FALSE'
            END),
            format('    v_refcursor REFCURSOR := %s;', quote_literal(p_refcursor)),
            'BEGIN',
            'LOOP',
            '-- Fetching row into RECORD variable',
            'IF (outer_block.v_rows_fetched = 0 AND',
            '    NOT outer_block.v_is_scrollable)',
            'THEN',
            '    FETCH FIRST',
            '     FROM outer_block.v_refcursor',
            '     INTO outer_block.v_refcur_rec;',
            'ELSE',
            '    FETCH NEXT',
            '     FROM outer_block.v_refcursor',
            '     INTO outer_block.v_refcur_rec;',
            'END IF;',
            '',
            '-- Exit when no more rows to fetch',
            'EXIT WHEN NOT FOUND;',
            'outer_block.v_rows_fetched := outer_block.v_rows_fetched + 1;',
            '',
            '-- Inserting column value into "dbms_sql$recordset" table',
            'EXECUTE',
            quote_literal(concat_ws(chr(10),
            'INSERT INTO dbms_sql$recordset (cursor_id,',
            '                                 rownum,',
            '                                 column_pos,',
            '                                 chr_val,',
            '                                 num_val,',
            '                                 dprec_val,',
            '                                 money_val,',
            '                                 tstamp_val,',
            '                                 tstamptz_val,',
            '                                 timetz_val,',
            '                                 interval_val,',
            '                                 bool_val,',
            '                                 xml_val,',
            '                                 bin_val)',
            ' SELECT $1,',
            '        $2,',
            '        colpos,',
            v_coldtype_cases, -- Coltypes distribution CASEs
            '   FROM (SELECT generate_series(1, $3) AS colpos,',
            '                dynsql.*',
            concat('           FROM (SELECT ',
            (SELECT string_agg(concat('$', col_num), concat(',', chr(10), repeat(' ', 24)))
               FROM generate_series(4, v_cols_count + 3) AS col_num)), -- List of consecutive column placeholders ($4, $5, ...)
            format('                ) AS dynsql (%s)', trim(v_col_aliases)), -- List of consecutive column aliases
            '        ) AS dynsql2')),
            'USING outer_block.v_cursor_id,',
            '      outer_block.v_rows_fetched,',
            '      outer_block.v_cols_count,',
            concat(v_col_names2, ';'),
            'END LOOP;',
            '',
            '-- Getting cursor metadata (JSON) object',
            'outer_block.v_cur_metadata :=',
            '    nullif(current_setting(format(''sct$dbms_sql.cursor_id_%s_metadata'',',
            '                                  outer_block.v_cursor_id), TRUE), '''');',
            '',
            '-- Setting "rows_count" (JSON) cursor property',
            'outer_block.v_cur_metadata := jsonb_set(outer_block.v_cur_metadata, ''{rows_count}'',',
            '                                        to_jsonb(outer_block.v_rows_fetched));',
            '',
            '-- Saving cursor metadata (JSON) object',
            'PERFORM set_config(format(''sct$dbms_sql.cursor_id_%s_metadata'', outer_block.v_cursor_id),',
            '                   outer_block.v_cur_metadata::TEXT, -- cursor metadata object',
            '                   FALSE);',
            'END; $dbms_sql$');

    EXECUTE v_prepdynsql_block; -- Will be saved into `dbms_sql$cursor` table if "v_debug_mode" is set to "ON" (1)

    -- Closing source REFCURSOR
    CLOSE p_refcursor;

    /* Logging of all dynamically generated scripts
       into `dbms_sql$cursor` if debug mode is "ON" */
    IF (v_debug_mode) THEN
        UPDATE dbms_sql$cursor
           SET colstype_block = v_colstype_block,
               prepdynsql_block = v_prepdynsql_block
         WHERE cursor_id = v_cursor_id;
    END IF;

    -- Setting `last_affected_cursor_id` variable
    PERFORM set_config('sct$dbms_sql.last_affected_cursor_id', v_cursor_id::TEXT, FALSE);

    -- Setting `last_row_count` variable
    PERFORM set_config('sct$dbms_sql.last_row_count', v_last_row_count::TEXT, FALSE);

    RETURN v_cursor_id;
EXCEPTION
    -- The REFCURSOR is not opened or NULL
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'Invalid cursor.',
                    DETAIL := 'Could not transform a not opened REFCURSOR into DBMS_SQL cursor number.',
                    HINT := '-1001';

    -- Duplicate column names in REFCURSOR
    WHEN duplicate_column THEN
        RAISE USING MESSAGE := 'Duplicate column name.',
                    DETAIL := 'The same column name was listed in REFCURSOR more than once, or some columns do not have assigned names.',
                    HINT := '-957';

    -- Some syntax error occurred
    WHEN syntax_error THEN
        GET STACKED DIAGNOSTICS v_err_message = MESSAGE_TEXT,
                                v_err_stack = PG_EXCEPTION_CONTEXT;

        RAISE USING MESSAGE := 'Syntax error has occured while trying to transform REFCURSOR into a DBMS_SQL cursor number.',
                    DETAIL := concat(v_err_message, '.'),
                    HINT := concat('(Call Stack)', chr(10), v_err_stack);
END;
$function$
LANGUAGE plpgsql;