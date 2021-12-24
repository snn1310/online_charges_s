CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$fetch_rows(IN p_cursor_id INTEGER)
RETURNS NUMERIC
AS
$function$
DECLARE
    v_cur_metadata JSONB;
    v_curr_row INTEGER;
    v_rows_count INTEGER;
    v_datatypes_rec RECORD;
    v_defcols_hash VARCHAR;
    v_last_row_count INTEGER;
    v_defcols_prevhash VARCHAR;
    v_current_user_oid BIGINT;
    v_rows_fetched INTEGER := 0;
BEGIN
    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    END IF;

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '');

    -- Obtaining current user OID
    v_current_user_oid := aws_oracle_ext.get_user_oid_by_name(current_user);

    /* Checking that effective user OID (current_user) of the caller on this cursor is the same
       as that of the caller of the most recent parse operation on this cursor.
       Actual for cursors opened with security level 2 */
    IF ((v_cur_metadata ->> 'security_level')::SMALLINT = 2 AND
        (v_cur_metadata ->> 'parse_user_oid')::BIGINT != v_current_user_oid)
    THEN
        RAISE invalid_role_specification;
    END IF;

    /* Additional check and operations if cursor
       was transformed from a REFCURSOR */
    IF ((v_cur_metadata ->> 'from_refcursor')::BOOLEAN) THEN
        -- Getting defined columns data hash
        v_defcols_hash := md5(v_cur_metadata ->> 'defcols_data');

        IF (v_defcols_hash IS NOT NULL AND
            v_defcols_hash != coalesce(v_cur_metadata ->> 'defcols_hash', ''))
        THEN
            -- Setting `defcols_hash` (JSON) cursor property
            v_cur_metadata := jsonb_set(v_cur_metadata, '{defcols_hash}', to_jsonb(v_defcols_hash));

            BEGIN
                /* Checking for correspondence between actual and declared column base data types
                   Oracle ORA-00932: INCONSISTENT_TYPE error is raised if the type of the given OUT parameter value
                   is different from the actual type of the value.
                   This type was the given type when the column was defined by calling `dbms_sql$define_column`.
                */
                FOR v_datatypes_rec IN
                (SELECT curcol.column_pos,
                        curcol.data_type AS cur_data_type,
                        defcol.data_type AS def_data_type
                   FROM dbms_sql$cursor_column AS curcol
                        INNER JOIN dbms_sql$define_column AS defcol ON (defcol.cursor_id = curcol.cursor_id AND
                                                                        defcol.column_pos = curcol.column_pos AND
                                                                        (defcol.base_type != curcol.base_type OR
                                                                         defcol.data_type IN ('TIMESTAMP WITHOUT TIME ZONE',
                                                                                              'TIMESTAMP WITH TIME ZONE') AND
                                                                         curcol.data_type IN ('TIME WITHOUT TIME ZONE',
                                                                                              'TIME WITH TIME ZONE')) AND
                                                                        coalesce(defcol.is_fixed, 0) != 1)
                  WHERE curcol.cursor_id = p_cursor_id)
                LOOP
                    -- Data types TIMESTAMP WITHOUT TIME ZONE and TIMESTAMP WITH TIME ZONE are interconvertible, thus they should not generate an error
                    CONTINUE WHEN substring(v_datatypes_rec.cur_data_type, 1, 14) = substring(v_datatypes_rec.def_data_type, 1, 14);

                    RAISE datatype_mismatch;
                END LOOP;
            EXCEPTION
                WHEN insufficient_privilege THEN
                    -- Effective userid changed
                    RAISE invalid_cursor_state;
            END;
        END IF;

        -- Getting `last_row_count` variable value
        v_last_row_count := nullif(current_setting('sct$dbms_sql.last_row_count', TRUE), '');

        -- Setting `last_row_count` variable
        PERFORM set_config('sct$dbms_sql.last_row_count', (v_last_row_count + 1)::TEXT, FALSE);
    END IF;

    -- Perform fetching while there are rows to fetch
    IF (coalesce((v_cur_metadata ->> 'curr_row')::INTEGER, 0) <= (v_cur_metadata ->> 'rows_count')::INTEGER)
    THEN
        -- Fetch: 1 {curr_row < rows_count}, 0 {curr_row = rows_count}
        v_rows_fetched := (coalesce((v_cur_metadata ->> 'curr_row')::INTEGER, 0) < (v_cur_metadata ->> 'rows_count')::INTEGER)::INTEGER;

        -- Setting `curr_row` (JSON) cursor property
        v_cur_metadata := jsonb_set(v_cur_metadata, '{curr_row}', to_jsonb(coalesce((v_cur_metadata ->> 'curr_row')::INTEGER, 0) + 1));
    ELSE
        -- ORA-01002: fetch out of sequence
        RAISE null_value_not_allowed;
    END IF;

    -- Saving cursor metadata (JSON) object
    PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id),
                       v_cur_metadata::TEXT,
                       FALSE);

    RETURN v_rows_fetched;
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Actual and declared base data types of a column do not match
    WHEN datatype_mismatch THEN
        RAISE USING MESSAGE := format('Inconsistent datatypes: expected %s got %s.',
                                      v_datatypes_rec.def_data_type,
                                      v_datatypes_rec.cur_data_type),
                    DETAIL := format('Actual and declared data types for column in position %s do not match.',
                                     v_datatypes_rec.column_pos),
                    HINT := '-932';

    -- Fetch from invalid cursor
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'Fetch out of sequence.',
                    DETAIL := 'A fetch has been attempted from a cursor which is no longer valid.',
                    HINT := '-1002';

    -- Effective userid (OID) changed since cursor parse
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'Effective userid is not the same as when cursor was parsed.',
                    DETAIL := 'The effective userid on this call to DBMS_SQL is not the same as that at the time the cursor was parsed.',
                    HINT := '-29470';
END;
$function$
LANGUAGE plpgsql;