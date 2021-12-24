CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$variable_value_char(IN p_cursor_id INTEGER,
                                                                       IN p_var_name TEXT,
                                                                       INOUT p_var_value ANYELEMENT)
AS
$function$
DECLARE
    v_var_info TEXT[];
    v_chr_val TEXT;
    v_is_fixed SMALLINT;
    v_var_size INTEGER;
    v_value_size INTEGER;
    v_out_var_size INTEGER;
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
        /* Extracting var data from "dbms_sql$bind_variable"
           (by cursor id and variable name) */
        SELECT var_size,
               value_size,
               is_fixed,
               chr_val
          INTO STRICT
               v_var_size,
               v_value_size,
               v_is_fixed,
               v_chr_val
          FROM dbms_sql$bind_variable
         WHERE cursor_id = p_cursor_id
           AND var_name = v_var_info[2]; -- Variable name
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Variable should not be declared using `dbms_sql$bind_variable`
    IF (coalesce(v_is_fixed, 0) != 1) THEN
        RAISE most_specific_type_mismatch;
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
           p_var_value := v_chr_val::NUMERIC;
       WHEN 'DOUBLE PRECISION' THEN
           p_var_value := v_chr_val::DOUBLE PRECISION;
       WHEN 'MONEY' THEN
           p_var_value := v_chr_val::MONEY;
       WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
           CASE v_out_var_data_t
              WHEN 'DATE'
              THEN
                  v_chr_val := regexp_replace(v_chr_val, '\s+', '', 'gi');

                  IF (char_length(v_chr_val) < 8) THEN
                      RAISE invalid_datetime_format;
                  END IF;

                  p_var_value := to_date(v_chr_val, 'dd-MON-yy');
              WHEN 'TIME WITHOUT TIME ZONE'
              THEN
                  v_chr_val := regexp_replace(v_chr_val, '\s*[AP]M', '', 'i');

                  IF (char_length(v_chr_val) < 8) THEN
                      RAISE invalid_datetime_format;
                  END IF;

                  p_var_value := v_chr_val::TIME;
              ELSE -- TIMESTAMP WITHOUT TIME ZONE
                  v_chr_val := trim(regexp_replace(v_chr_val, '\s*[AP]M', '', 'i'));

                  IF (char_length(v_chr_val) < 17) THEN
                      RAISE invalid_datetime_format;
                  END IF;

                  p_var_value := v_chr_val::TIMESTAMP;
              END CASE;
       WHEN 'TIMESTAMP WITH TIME ZONE' THEN
           v_chr_val := trim(regexp_replace(v_chr_val, '\s*[AP]M', '', 'i'));

           IF (char_length(v_chr_val) < 17) THEN
               RAISE invalid_datetime_format;
           END IF;

           p_var_value := to_timestamp(v_chr_val, 'dd-MON-yy hh24:mi:ss.us');
       WHEN 'TIME WITH TIME ZONE' THEN
           IF (char_length(v_chr_val) < 8) THEN
               RAISE invalid_datetime_format;
           END IF;

           p_var_value := v_chr_val::TIMETZ;
       WHEN 'INTERVAL' THEN
           p_var_value := v_chr_val::INTERVAL;
       WHEN 'BOOLEAN' THEN
           p_var_value := v_chr_val::BOOLEAN;
       WHEN 'XML' THEN
           BEGIN
               p_var_value := v_chr_val::XML;
           EXCEPTION
               WHEN OTHERS THEN
               RAISE invalid_xml_document;
           END;
       WHEN 'BYTEA' THEN
           BEGIN
               p_var_value := decode(v_chr_val, 'hex');
           EXCEPTION
               WHEN OTHERS THEN
               RAISE invalid_binary_representation;
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

    -- Length of OUT argument is too small
    WHEN string_data_length_mismatch THEN
        RAISE USING MESSAGE := 'Character string buffer too small.',
                    DETAIL := 'Length of OUT argument is too small to store bind variable value.',
                    HINT := '-6502';

    -- Variable value length exceeds declared OUT value size
    WHEN numeric_value_out_of_range THEN
        RAISE USING MESSAGE := 'Variable value length exceeds declared OUT value size.',
                    DETAIL := format('Variable value length: %s, declared variable OUT value size: %s.',
                                     char_length(v_chr_val), v_value_size),
                    HINT := '-6502';

    /* OUT argument base type does not match bind variable declared base type.
       Variable was declared through `dbms_sql$bind_variable` */
    WHEN most_specific_type_mismatch THEN
        RAISE USING MESSAGE := 'Type of OUT argument does not match declared type of bind variable.',
                    DETAIL := 'Attempting to get the value of a bind variable but the type of the given OUT argument is different from the type of bind variable that was defined previously.',
                    HINT := '-6562';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';

    -- Possible data type conversion error (char to numeric\money)
    WHEN invalid_text_representation THEN
        RAISE USING MESSAGE := 'Error during variable value conversion (from char to numeric\money).',
                    DETAIL := format('Value %s is not correct for conversion to numeric\money.',
                                     quote_literal(v_chr_val));

    -- Possible data type conversion error (char to datetime\interval)
    WHEN invalid_datetime_format THEN
        RAISE USING MESSAGE := 'Error during variable value conversion (from char to datetime\interval).',
                    DETAIL := format('Value %s is not correct for conversion to datetime\interval.',
                                     quote_literal(v_chr_val));

    -- Possible data type conversion error (char to binary data)
    WHEN invalid_binary_representation THEN
        RAISE USING MESSAGE := 'Error during variable value conversion (from char to binary data).',
                    DETAIL := format('Value %s is not correct for conversion to binary data.',
                                     quote_literal(v_chr_val));

    -- Possible data type conversion error (char to XML document)
    WHEN invalid_xml_document THEN
        RAISE USING MESSAGE := 'Error during variable value conversion (from char to XML document).',
                    DETAIL := format('Value %s is not correct for conversion to XML document.',
                                     quote_literal(v_chr_val));
END;
$function$
LANGUAGE plpgsql
STABLE;