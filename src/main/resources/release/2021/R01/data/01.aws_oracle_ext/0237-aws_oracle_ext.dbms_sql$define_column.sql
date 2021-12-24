CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$define_column(IN p_cursor_id INTEGER,
                                                                 IN p_column_pos INTEGER,
                                                                 IN p_column_var ANYELEMENT,
                                                                 IN p_col_size INTEGER DEFAULT NULL)
RETURNS VOID
AS
$function$
DECLARE
    v_cur_metadata JSONB;
    v_defcols_data JSONB;
    v_col_size INTEGER;
    v_colvar_len INTEGER;
    v_defcol_base_t TEXT;
    v_current_user_oid BIGINT;
    v_defcol_data_t TEXT := upper(pg_typeof(p_column_var)::TEXT);
BEGIN
    -- Checking that cursor is opened
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

    -- Column position must be within the range 1..cols_count
    IF (p_column_pos NOT BETWEEN 1 AND (v_cur_metadata ->> 'cols_count')::SMALLINT) THEN
        RAISE check_violation;
    END IF;

    -- Determining base data type of passed variable
    v_defcol_base_t := aws_oracle_ext.get_base_type_by_dtype(v_defcol_data_t);

    IF (v_defcol_base_t = 'TEXT')
    THEN
        v_colvar_len := coalesce(length(p_column_var::BYTEA, pg_client_encoding()), 0);
        v_col_size := CASE
                         WHEN p_col_size IS NOT NULL THEN p_col_size
                         WHEN v_colvar_len > 0 THEN v_colvar_len
                      END;
    ELSIF (v_defcol_base_t = 'BYTEA')
    THEN
        v_col_size := p_col_size;
    END IF;

    BEGIN
        -- Saving defined columns data into temp table
        INSERT INTO dbms_sql$define_column (cursor_id,
                                            column_pos,
                                            data_type,
                                            base_type,
                                            col_size,
                                            is_fixed)
             VALUES (p_cursor_id,
                     p_column_pos,
                     v_defcol_data_t,
                     v_defcol_base_t,
                     v_col_size,
                     NULL)
        ON CONFLICT (cursor_id, column_pos)
        DO UPDATE SET data_type = v_defcol_data_t,
                      base_type = v_defcol_base_t,
                      col_size = v_col_size,
                      is_fixed = NULL;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Serializing defined columns data into JSON object
    SELECT jsonb_object_agg(concat('col_', defcol_data.column_pos),
                            defcol_data.column_data)
      INTO v_defcols_data
      FROM (SELECT defcol3.column_pos,
                   (SELECT to_jsonb(defcol2.*)
                      FROM (SELECT defcol1.data_type,
                                   defcol1.base_type,
                                   defcol1.col_size,
                                   defcol1.is_fixed
                              FROM dbms_sql$define_column AS defcol1
                             WHERE defcol1.cursor_id = defcol3.cursor_id
                               AND defcol1.column_pos = defcol3.column_pos
                           ) AS defcol2
                   ) AS column_data
              FROM dbms_sql$define_column AS defcol3
             WHERE defcol3.cursor_id = p_cursor_id
           ) AS defcol_data;

    -- Setting "defcols_data" (JSON) cursor property
    v_cur_metadata := jsonb_set(v_cur_metadata, '{defcols_data}', v_defcols_data);

    -- Saving cursor metadata (JSON) object
    PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id),
                       v_cur_metadata::TEXT,
                       FALSE);
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Column position lies outside of range 1..cols_count
    WHEN check_violation THEN
        RAISE USING MESSAGE := 'Column not in select list.',
                    DETAIL := 'Reference to a column not listed in the SELECT clause.',
                    HINT := '-1007';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql;