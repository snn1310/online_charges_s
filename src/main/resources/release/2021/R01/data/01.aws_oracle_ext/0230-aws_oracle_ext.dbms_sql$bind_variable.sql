CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$bind_variable(IN p_cursor_id INTEGER,
                                                                 IN p_var_name TEXT,
                                                                 IN p_var_value ANYELEMENT,
                                                                 IN p_value_size INTEGER DEFAULT NULL,
                                                                 IN p_check_var_exists BOOLEAN DEFAULT TRUE)
RETURNS VOID
AS
$function$
DECLARE
    v_var_pos INTEGER;
    v_var_info TEXT[];
    v_chr_val TEXT;
    v_num_val NUMERIC;
    v_dprec_val DOUBLE PRECISION;
    v_money_val MONEY;
    v_tstamp_val TIMESTAMP WITHOUT TIME ZONE;
    v_tstamptz_val TIMESTAMP WITH TIME ZONE;
    v_timetz_val TIME WITH TIME ZONE;
    v_interval_val INTERVAL;
    v_bool_val BOOLEAN;
    v_xml_val XML;
    v_bin_val BYTEA;
    v_var_size INTEGER;
    v_value_size INTEGER;
    v_is_fixed SMALLINT;
    v_sql_statement TEXT;
    v_cur_metadata JSONB;
    v_out_var_base_t TEXT;
    v_out_var_data_t TEXT;
    v_current_user_oid BIGINT;
BEGIN
    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id))
    THEN
        RAISE invalid_cursor_state;
    -- Variable name should not be empty or blank (null)
    ELSIF (NOT p_check_var_exists AND
           nullif(trim(p_var_name), '') IS NULL)
    THEN
        RAISE null_value_not_allowed;
    END IF;

    -- Obtaining current user OID
    v_current_user_oid := aws_oracle_ext.get_user_oid_by_name(current_user);

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    /* Checking that effective user OID (current_user) of the caller on this cursor is the same
       as that of the caller of the most recent parse operation on this cursor.
       Actual for cursors opened with security level 1 or 2 */
    IF ((v_cur_metadata ->> 'security_level')::SMALLINT IN (1, 2) AND
        (v_cur_metadata ->> 'parse_user_oid')::BIGINT != v_current_user_oid)
    THEN
        RAISE invalid_role_specification;
    END IF;

    BEGIN
        -- Getting SQL-PL/pgSQL statement by cursor id
        SELECT sql_statement
          INTO v_sql_statement
          FROM dbms_sql$cursor
         WHERE cursor_id = p_cursor_id;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Checking whether statement parsed
    IF (v_sql_statement IS NULL) THEN
        RAISE sql_statement_not_yet_complete;
    END IF;

    -- Extracting variable info (label in statement code and general name) from supplied string
    v_var_info := regexp_matches(p_var_name, '^((?:\s*\$\d+\s*(?:[\|,;\-_])?)+)*\s*[\:|\|]?([[:alnum:]_]+)\s*$', 'gi');
    v_var_info[1] := regexp_replace(regexp_replace(v_var_info[1], '\s*[\|,;\-_]\s*', '|', 'g'), '^\s*|\s*[\|,;\-_]$', '', 'gi');

    /* Checking that variable, either by name or any of its markers,
       exists in the corresponding SQL statement */
    IF ((v_var_info[2] IS NULL OR
         v_sql_statement !~* coalesce(v_var_info[2], '')) AND
        coalesce(p_check_var_exists, TRUE)) -- variable name
    THEN
        IF (v_var_info[1] IS NULL OR
            v_sql_statement !~* replace(concat('(', v_var_info[1], ')(?!\d)'), '$', '\$')) -- markers list
        THEN
            RAISE null_value_not_allowed;
        END IF;
    END IF;

    v_out_var_data_t := upper(pg_typeof(p_var_value)::TEXT);

    -- Determining base data type of passed variable
    v_out_var_base_t := aws_oracle_ext.get_base_type_by_dtype(v_out_var_data_t);

    CASE v_out_var_base_t
       WHEN 'TEXT' THEN
           v_chr_val := p_var_value::TEXT;
           v_var_size := coalesce(length(p_var_value::BYTEA, pg_client_encoding()), 0);
           v_value_size := coalesce(p_value_size, v_var_size);
       WHEN 'NUMERIC' THEN
           v_num_val := p_var_value::NUMERIC;
       WHEN 'DOUBLE PRECISION' THEN
           v_dprec_val := p_var_value::DOUBLE PRECISION;
       WHEN 'MONEY' THEN
           v_money_val := p_var_value;
       WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
           IF (v_out_var_data_t = 'TIME WITHOUT TIME ZONE') THEN
               v_tstamp_val := to_char(p_var_value, '2001-01-01 hh24:mi:ss.us')::TIMESTAMP;
           ELSE
               v_tstamp_val := p_var_value;
           END IF;
       WHEN 'TIMESTAMP WITH TIME ZONE' THEN
           v_tstamptz_val := p_var_value;
       WHEN 'TIME WITH TIME ZONE' THEN
           v_timetz_val := p_var_value;
       WHEN 'INTERVAL' THEN
           v_interval_val := p_var_value;
       WHEN 'BOOLEAN' THEN
           v_bool_val := p_var_value;
       WHEN 'XML' THEN
           v_xml_val := p_var_value;
       WHEN 'BYTEA' THEN
           v_bin_val := p_var_value;
           v_var_size := coalesce(octet_length(p_var_value), 0);
           v_value_size := p_value_size;
       ELSE RETURN;
    END CASE;

    -- Determining next variable position
    SELECT coalesce(MAX(var_pos), 0) + 1
      INTO v_var_pos
      FROM dbms_sql$bind_variable
     WHERE cursor_id = p_cursor_id;

    -- Binding variable to cursor (identified by cursor_id)
    INSERT INTO dbms_sql$bind_variable (cursor_id,
                                        var_pos,
                                        var_name,
                                        var_label,
                                        data_type,
                                        base_type,
                                        var_size,
                                        value_size,
                                        is_fixed,
                                        chr_val,
                                        num_val,
                                        dprec_val,
                                        money_val,
                                        tstamp_val,
                                        tstamptz_val,
                                        timetz_val,
                                        interval_val,
                                        bool_val,
                                        xml_val,
                                        bin_val)
         VALUES (p_cursor_id,
                 v_var_pos,
                 v_var_info[2], -- Variable name
                 v_var_info[1], -- Variable label list
                 v_out_var_data_t,
                 v_out_var_base_t,
                 v_var_size,
                 v_value_size,
                 v_is_fixed,
                 v_chr_val,
                 v_num_val,
                 v_dprec_val,
                 v_money_val,
                 v_tstamp_val,
                 v_tstamptz_val,
                 v_timetz_val,
                 v_interval_val,
                 v_bool_val,
                 v_xml_val,
                 v_bin_val)
    ON CONFLICT (cursor_id, var_name)
    DO UPDATE SET var_label = v_var_info[1],
                  data_type = v_out_var_data_t,
                  base_type = v_out_var_base_t,
                  var_size = v_var_size,
                  value_size = v_value_size,
                  is_fixed = v_is_fixed,
                  chr_val = v_chr_val,
                  num_val = v_num_val,
                  dprec_val = v_dprec_val,
                  money_val = v_money_val,
                  tstamp_val = v_tstamp_val,
                  tstamptz_val = v_tstamptz_val,
                  timetz_val = v_timetz_val,
                  interval_val = v_interval_val,
                  bool_val = v_bool_val,
                  xml_val = v_xml_val,
                  bin_val = v_bin_val;
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Bind variable does not exist
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'Bind variable does not exist.',
                    DETAIL := 'Call for a bind variable that was not listed in the corresponding SQL statement.',
                    HINT := '-1006';

    -- No statement previously parsed
    WHEN sql_statement_not_yet_complete THEN
        RAISE USING MESSAGE := 'No statement parsed.',
                    DETAIL := 'Attempting to reference a cursor with the SQL statement associated not parsed.',
                    HINT := '-1003';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql;