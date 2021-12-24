CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$column_value(IN p_cursor_id INTEGER,
                                                                IN p_column_pos INTEGER,
                                                                INOUT p_column_val ANYELEMENT,
                                                                INOUT p_column_err NUMERIC DEFAULT NULL,
                                                                INOUT p_actual_len NUMERIC DEFAULT NULL,
                                                                INOUT p_typvar_len NUMERIC DEFAULT NULL)
AS
$function$
DECLARE
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
    v_col_size INTEGER;
    v_defcol_data JSONB;
    v_curcol_data JSONB;
    v_cur_metadata JSONB;
    v_curcol_data_t TEXT;
    v_curcol_base_t TEXT;
    v_defcol_data_t TEXT;
    v_defcol_base_t TEXT;
    v_out_var_base_t TEXT;
    v_out_var_data_t TEXT;
    v_current_user_oid BIGINT;
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

    -- Getting dynamic SQL statement defined and actual columns info (JSON)
    v_defcol_data := (v_cur_metadata #> format('{defcols_data, col_%s}', p_column_pos)::TEXT[]);
    v_curcol_data := (v_cur_metadata #> format('{curcols_data, col_%s}', p_column_pos)::TEXT[]);

    v_defcol_data_t := (v_defcol_data ->> 'data_type'); -- Column (defined) data type
    v_defcol_base_t := (v_defcol_data ->> 'base_type'); -- Column (defined) base data type
    v_curcol_data_t := (v_curcol_data ->> 'data_type'); -- Column (actual) data type
    v_curcol_base_t := (v_curcol_data ->> 'base_type'); -- Column (actual) base data type

    v_col_size := (v_defcol_data ->> 'col_size'); -- Column size in characters

    v_out_var_data_t := upper(pg_typeof(p_column_val)::TEXT);

    -- Determining base data type of passed variable
    v_out_var_base_t := aws_oracle_ext.get_base_type_by_dtype(v_out_var_data_t);

    -- Default vars states
    p_column_val := NULL;
    p_column_err := 0;
    p_actual_len := 0;
    p_typvar_len := 0;

    -- Column position should be declared in SELECT list
    IF (v_defcol_base_t IS NULL) THEN
        RAISE null_value_not_allowed;
    -- Check if OUT argument base type matches declared column base type (with some exclusions)
    ELSIF ((substring(v_out_var_base_t, 1, 14) != substring(v_defcol_base_t, 1, 14) AND -- TIMESTAMPs
            substring(v_out_var_base_t, 1, 5) != substring(v_defcol_base_t, 1, 5) AND -- TIMEs
            (substring(v_out_var_data_t, 1, 5) != 'TIME ' AND
             substring(v_defcol_data_t, 1, 10) != 'TIMESTAMP ') AND
            NOT (v_defcol_base_t IN ('NUMERIC',
                                     'DOUBLE PRECISION') AND
                 v_out_var_base_t IN ('NUMERIC',
                                      'DOUBLE PRECISION'))) OR
           (substring(v_defcol_data_t, 1, 5) = 'TIME ' AND
            (substring(v_out_var_data_t, 1, 10) = 'TIMESTAMP ' OR
             v_out_var_data_t = 'DATE')))
    THEN
        RAISE datatype_mismatch;
    -- Variable should not be declared using `dbms_sql$define_column_char`
    ELSIF ((v_defcol_data ->> 'is_fixed')::SMALLINT = 1) THEN
        RAISE datatype_mismatch;
    -- If current row not specified, then nothing to return
    ELSIF ((v_cur_metadata ->> 'curr_row') IS NULL) THEN
        RETURN;
    END IF;

    BEGIN
        /* Extracting row data from execution results
           table `dbms_sql$recordset`
           (by cursor id, row number, column position) */
        SELECT chr_val,
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
          INTO v_chr_val,
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
          FROM dbms_sql$recordset
         WHERE cursor_id = p_cursor_id
           AND rownum = (v_cur_metadata ->> 'curr_row')::INTEGER
           AND column_pos = p_column_pos;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Casting data type and copying value into the OUT argument
    IF (v_out_var_base_t = 'TEXT')
    THEN
        -- Actual length of the data (chars)
        IF (v_chr_val IS NOT NULL) THEN
            p_typvar_len :=
                CASE v_curcol_data_t
                   WHEN 'CHARACTER' THEN (v_curcol_data ->> 'chr_max_len')::INTEGER
                   ELSE char_length(v_chr_val)
                END;
        END IF;

        IF (v_col_size IS NULL) THEN
            p_column_val := v_chr_val;
        ELSE
            p_column_val := substring(v_chr_val, 1, v_col_size);

            IF (v_col_size != 0 AND v_col_size < p_typvar_len)
            THEN
                p_column_err := 1406;
            END IF;
        END IF;

        /* Internal representation (bytes).
           4 bytes + length of text */
        IF (v_chr_val IS NOT NULL) THEN
            p_actual_len :=
                CASE v_curcol_data_t
                   WHEN 'CHARACTER' THEN (v_curcol_data ->> 'chr_byte_len')::INTEGER
                   ELSE pg_column_size(v_chr_val)
                END;
        END IF;
    ELSIF (v_out_var_base_t IN ('NUMERIC',
                                'DOUBLE PRECISION'))
    THEN
        -- Determining data source column
        IF (v_curcol_base_t = 'NUMERIC') THEN
            p_column_val := v_num_val;
        ELSE
            p_column_val := v_dprec_val;
        END IF;

        -- Internal representation (bytes)
        IF (p_column_val IS NOT NULL) THEN
            p_actual_len :=
                CASE v_curcol_data_t
                   WHEN 'SMALLINT' THEN 2 -- 2 bytes
                   WHEN 'INTEGER' THEN 4 -- 4 bytes
                   WHEN 'BIGINT' THEN 8 -- 8 bytes
                   WHEN 'REAL' THEN 4 -- 4 bytes
                   WHEN 'DOUBLE PRECISION' THEN 8 -- 8 bytes
                   WHEN 'NUMERIC' THEN pg_column_size(p_column_val)
                END;
        END IF;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t = 'MONEY')
    THEN
        p_column_val := v_money_val;

        -- Internal representation, 8 bytes
        p_actual_len := CASE
                           WHEN p_column_val IS NOT NULL
                           THEN 8
                        END;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t IN ('TIMESTAMP WITHOUT TIME ZONE',
                                'TIMESTAMP WITH TIME ZONE'))
    THEN
        CASE v_curcol_base_t
           WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN
               p_column_val := v_tstamp_val;
           WHEN 'TIMESTAMP WITH TIME ZONE' THEN
               p_column_val := v_tstamptz_val;
           ELSE
               p_column_val := v_timetz_val;
        END CASE;

        -- Internal representation (bytes)
        p_actual_len := CASE
                           WHEN p_column_val IS NOT NULL
                           THEN CASE v_curcol_data_t
                                   WHEN 'DATE' THEN 4
                                   WHEN 'TIME WITH TIME ZONE' THEN 12
                                   ELSE 8
                                END
                        END;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t = 'TIME WITH TIME ZONE')
    THEN
        p_column_val := CASE v_curcol_base_t
                           WHEN 'TIMESTAMP WITHOUT TIME ZONE' THEN v_tstamp_val::TIME::TIMETZ
                           WHEN 'TIMESTAMP WITH TIME ZONE' THEN v_tstamptz_val::TIMETZ
                           ELSE v_timetz_val
                        END;

        -- Internal representation (bytes)
        p_actual_len := CASE
                           WHEN p_column_val IS NOT NULL
                           THEN CASE v_curcol_data_t
                                   WHEN 'DATE' THEN 4
                                   WHEN 'TIME WITH TIME ZONE' THEN 12
                                   ELSE 8
                                END
                        END;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t = 'INTERVAL')
    THEN
        p_column_val := v_interval_val;

        -- Internal representation, 16 bytes
        p_actual_len := CASE
                           WHEN p_column_val IS NOT NULL
                           THEN 16
                        END;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t = 'BOOLEAN')
    THEN
        p_column_val := v_bool_val;

        /* Internal representation (bytes).
           1 byte, for TRUE or FALSE value */
        p_actual_len := CASE
                           WHEN p_column_val IS NOT NULL
                           THEN 1
                        END;

        /* Actual length of the data (bytes).
           Same as internal representation */
        p_typvar_len := p_actual_len;
    ELSIF (v_out_var_base_t = 'XML')
    THEN
        p_column_val := v_xml_val;

        -- Internal representation (bytes)
        p_actual_len := pg_column_size(p_column_val);

        -- Actual length of the data (chars)
        p_typvar_len := char_length(p_column_val::TEXT);
    ELSIF (v_out_var_base_t = 'BYTEA')
    THEN
        p_column_val := CASE
                           WHEN v_col_size IS NULL THEN v_bin_val
                           ELSE substring(v_bin_val from 1 for v_col_size)
                        END;

        /* Internal representation (bytes).
           4 bytes + actual length of the data */
        p_actual_len := pg_column_size(v_bin_val);

        -- Actual length of the data (bytes)
        p_typvar_len := octet_length(v_bin_val);

        IF (v_col_size != 0 AND v_col_size < p_typvar_len)
        THEN
            p_column_err := 1406;
        END IF;
    END IF;

    IF (p_column_val IS NULL) THEN
        p_column_err := 1405;
    END IF;

    p_actual_len := coalesce(p_actual_len, 0);
    p_typvar_len := coalesce(p_typvar_len, 0);
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Column position is not declared in SELECT list
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'Column not in select list.',
                    DETAIL := 'A reference was made to a column not listed in the SELECT clause.',
                    HINT := '-1007';

    /* OUT argument base type does not match declared column base type.
       Possible column was declared through `dbms_sql$define_column_char` */
    WHEN datatype_mismatch THEN
        RAISE USING MESSAGE := 'Type of OUT argument does not match declared column type.',
                    DETAIL := 'Attempting to get the value of a column but the type of the given OUT argument is different from the type of column that was defined previously.',
                    HINT := '-6562';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql
STABLE;