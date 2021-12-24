CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$column_value_long(IN p_cursor_id INTEGER,
                                                                     IN p_column_pos INTEGER,
                                                                     IN p_byte_len INTEGER,
                                                                     IN p_offset INTEGER,
                                                                     INOUT p_column_val TEXT,
                                                                     INOUT p_length_val NUMERIC,
                                                                     INOUT p_typvar_len NUMERIC DEFAULT NULL)
AS
$function$
DECLARE
    v_chr_val TEXT;
    v_chr_binval BYTEA;
    v_defcol_data JSONB;
    v_cur_metadata JSONB;
    v_defcol_base_t TEXT;
    v_current_user_oid BIGINT;
    v_out_var_base_t TEXT := 'TEXT';
BEGIN
    -- Checking that cursor is opened (exit if it is not)
    IF (NOT aws_oracle_ext.dbms_sql$is_open(p_cursor_id)) THEN
        RAISE invalid_cursor_state;
    -- Length of the segment to retrieve (in bytes) should be 1 or above
    ELSIF (coalesce(p_byte_len, 0) = 0) THEN
        RAISE zero_length_character_string;
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

    -- Getting dynamic SQL statement defined columns info (JSON)
    v_defcol_data := (v_cur_metadata #> format('{defcols_data, col_%s}', p_column_pos)::TEXT[]);

    v_defcol_base_t := (v_defcol_data ->> 'base_type'); -- Column base data type

    -- Check if data is previously fetched from cursor
    IF ((v_cur_metadata ->> 'curr_row') IS NULL) THEN
        RAISE null_value_not_allowed;
    -- Column position should be declared in SELECT list
    ELSIF (v_defcol_base_t IS NULL) THEN
        RAISE too_many_columns;
    -- Check if OUT argument base type matches declared column base type
    ELSIF (v_out_var_base_t != substring(v_defcol_base_t, 1, 14)) THEN
        RAISE datatype_mismatch;
    -- Column should not be declared using `dbms_sql$define_column_char`
    ELSIF ((v_defcol_data ->> 'is_fixed')::SMALLINT = 1) THEN
        RAISE datatype_mismatch;
    END IF;

    BEGIN
        /* Extracting row data from execution results
           table `dbms_sql$recordset`
           (by cursor id, row number, column position) */
        SELECT chr_val
          INTO v_chr_val
          FROM dbms_sql$recordset
         WHERE cursor_id = p_cursor_id
           AND rownum = (v_cur_metadata ->> 'curr_row')::INTEGER
           AND column_pos = p_column_pos;
    EXCEPTION
        WHEN insufficient_privilege THEN
            -- Effective userid changed
            RAISE invalid_cursor_state;
    END;

    -- Extracting data from binary string and copying it into the OUT argument
    v_chr_binval := substring(v_chr_val::BYTEA from (p_offset + 1) for p_byte_len);
    p_column_val := convert_from(v_chr_binval, pg_client_encoding());

    /* Internal representation (bytes).
       4 bytes + actual length of the data */
    p_length_val := coalesce(pg_column_size(v_chr_binval), 0);

    -- Actual length of the data (bytes)
    p_typvar_len := coalesce(octet_length(v_chr_binval), 0);
EXCEPTION
    -- Cursor is not opened or does not exist
    WHEN invalid_cursor_state THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';

    -- Length of the segment to retrieve (in bytes) is zero or less
    WHEN zero_length_character_string THEN
        RAISE USING MESSAGE := 'Numeric or value error.',
                    DETAIL := 'Length of the segment to retrieve (in bytes) must be 1 or above.',
                    HINT := '-6502';

    -- Resulting data was not previously fetched from cursor
    WHEN null_value_not_allowed THEN
        RAISE USING MESSAGE := 'This function can be called only after a fetch.',
                    DETAIL := 'The function was called before the fetch operation on cursor.',
                    HINT := '-1016';

    -- Column position is not declared in SELECT list
    WHEN too_many_columns THEN
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