CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$variable_value(IN p_cursor_id INTEGER,
                                                                  IN p_var_name TEXT,
                                                                  INOUT p_var_value ANYELEMENT)
AS
$function$
DECLARE
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
    v_is_fixed SMALLINT;
    v_value_size INTEGER;
    v_out_var_size INTEGER;
    v_bind_var_data_t TEXT;
    v_bind_var_base_t TEXT;
    v_out_var_base_t TEXT;
    v_out_var_data_t TEXT;
    v_cur_metadata JSONB;
    v_current_user_oid BIGINT;
BEGIN
    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    -- Variable name should not be empty or blank (null)
    ELSIF (nullif(trim(p_var_name), '') IS NULL) THEN
        RAISE no_data_found;
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

    v_out_var_data_t := upper(pg_typeof(p_var_value)::TEXT);

    -- Determining base data type of passed variable
    v_out_var_base_t := aws_oracle_ext.get_base_type_by_dtype(v_out_var_data_t);

    -- Extracting variable info (label in statement code and general name) from supplied string
    v_var_info := regexp_matches(p_var_name, '^((?:\s*\$\d+\s*(?:\|)?)+)*\s*\:?([[:alnum:]_]+)\s*$', 'gi');

    BEGIN
        /* Extracting var data from `dbms_sql$bind_variable`
           (by cursor id and variable name) */
        SELECT data_type,
               base_type,
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
               bin_val
          INTO STRICT
               v_bind_var_data_t,
               v_bind_var_base_t,
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
               v_bin_val
          FROM dbms_sql$bind_variable
         WHERE cursor_id = p_cursor_id
           AND var_name = v_var_info[2]; -- Variable name
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Check if OUT argument base type matches declared bind variable base type
    IF ((substring(v_out_var_base_t, 1, 14) != substring(v_bind_var_base_t, 1, 14) AND -- TIMESTAMPs
         substring(v_out_var_base_t, 1, 5) != substring(v_bind_var_base_t, 1, 5) AND -- TIMEs
         (substring(v_out_var_data_t, 1, 5) != 'TIME ' AND
          substring(v_bind_var_data_t, 1, 10) != 'TIMESTAMP ') AND
         NOT (v_bind_var_base_t IN ('NUMERIC',
                                    'DOUBLE PRECISION') AND
              v_out_var_base_t IN ('NUMERIC',
                                   'DOUBLE PRECISION'))) OR
           (substring(v_bind_var_data_t, 1, 5) = 'TIME ' AND
            (substring(v_out_var_data_t, 1, 10) = 'TIMESTAMP ' OR
             v_out_var_data_t = 'DATE')))
    THEN
        RAISE datatype_mismatch;
    -- Variable should not be declared using `dbms_sql$bind_variable_char`
    ELSIF (v_is_fixed = 1) THEN
        RAISE datatype_mismatch;
    END IF;

    -- Copying value into the OUT argument
    CASE v_out_var_base_t
       WHEN 'TEXT' THEN
           IF (v_value_size != 0 AND v_value_size < char_length(v_chr_val)) THEN
               -- ORA-06502: PL/SQL: numeric or value error
               RAISE numeric_value_out_of_range;
           END IF;

           IF (v_out_var_data_t = 'CHARACTER') THEN
               v_out_var_size := coalesce(length(p_var_value::BYTEA, pg_client_encoding()), 0);

               IF (v_out_var_size != 0 AND v_out_var_size < char_length(v_chr_val)) THEN
                   /* ORA-06502: PL/SQL: numeric or value error.
                      Character string buffer too small */
                   RAISE string_data_length_mismatch;
               END IF;
           END IF;

           p_var_value := v_chr_val;
       WHEN 'NUMERIC' THEN
           IF (v_bind_var_base_t = 'NUMERIC') THEN
               p_var_value := v_num_val;
           ELSE
               p_var_value := v_dprec_val;
           END IF;
       WHEN 'DOUBLE PRECISION' THEN
           IF (v_bind_var_base_t = 'DOUBLE PRECISION') THEN
               p_var_value := v_dprec_val;
           ELSE
               p_var_value := v_num_val;
           END IF;
       WHEN 'MONEY' THEN
           p_var_value := v_money_val;
       WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
           CASE v_bind_var_base_t
              WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
                  p_var_value := v_tstamp_val;
              WHEN 'TIMESTAMP WITH TIME ZONE' THEN
                  p_var_value := v_tstamptz_val;
              ELSE
                  p_var_value := v_timetz_val;
           END CASE;
       WHEN 'TIMESTAMP WITH TIME ZONE' THEN
           p_var_value := CASE v_bind_var_base_t
                             WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN v_tstamp_val::TIMESTAMPTZ
                             ELSE v_tstamptz_val
                          END;
       WHEN 'TIME WITH TIME ZONE' THEN
           p_var_value := CASE v_bind_var_base_t
                             WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN v_tstamp_val::TIME::TIMETZ
                             WHEN 'TIMESTAMP WITH TIME ZONE' THEN v_tstamptz_val::TIMETZ
                             ELSE v_timetz_val
                          END;
       WHEN 'INTERVAL' THEN
           p_var_value := v_interval_val;
       WHEN 'BOOLEAN' THEN
           p_var_value := v_bool_val;
       WHEN 'XML' THEN
           p_var_value := v_xml_val;
       WHEN 'BYTEA' THEN
           p_var_value := CASE
                             WHEN v_value_size IS NULL THEN v_bin_val
                             ELSE substring(v_bin_val from 1 for v_value_size)
                          END;
       ELSE
           p_var_value := NULL;
    END CASE;
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Bind variable does not exist
    WHEN no_data_found THEN
        RAISE USING MESSAGE := 'Bind variable does not exist.',
                    DETAIL := 'Call for a bind variable that was not listed in the corresponding SQL statement.',
                    HINT := '-1006';

    /* OUT argument base type does not match bind variable declared base type.
       Variable was declared through `dbms_sql$bind_variable_char` */
    WHEN datatype_mismatch THEN
        RAISE USING MESSAGE := 'Type of OUT argument does not match declared type of bind variable.',
                    DETAIL := 'Attempting to get the value of a bind variable but the type of the given OUT argument is different from the type of bind variable that was defined previously.',
                    HINT := '-6562';

    -- Variable value length exceeds declared OUT value size
    WHEN numeric_value_out_of_range THEN
        RAISE USING MESSAGE := 'Variable value length exceeds declared OUT value size.',
                    DETAIL := format('Variable value length: %s, declared variable OUT value size: %s.',
                                     char_length(v_chr_val), v_value_size),
                    HINT := '-6502';

    -- Length of OUT argument is too small
    WHEN string_data_length_mismatch THEN
        RAISE USING MESSAGE := 'Character string buffer too small.',
                    DETAIL := 'Length of OUT argument is too small to store bind variable value.',
                    HINT := '-6502';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql
STABLE;