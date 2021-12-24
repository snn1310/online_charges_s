CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$close_cursor(INOUT p_cursor_id NUMERIC)
RETURNS NUMERIC
AS
$function$
DECLARE
    v_cursor_id INTEGER := p_cursor_id;
BEGIN
    /* Close DBMS_SQL cursor only if it is opened.
       This prevents a secondary exception raising when trying
       to close DBMS_SQL cursor in EXCEPTION section.
    */
    IF (aws_oracle_ext.dbms_sql$is_open(v_cursor_id))
    THEN
        -- Deleting related data from all temp tables
        DELETE FROM dbms_sql$cursor
              WHERE cursor_id = v_cursor_id;

        -- Nulling cursor metadata (JSON) object
        PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', v_cursor_id), NULL, FALSE);

        -- Setting `last_affected_cursor_id` variable
        PERFORM set_config('sct$dbms_sql.last_affected_cursor_id', v_cursor_id::TEXT, FALSE);

        -- Nulling `last_row_count` variable
        PERFORM set_config('sct$dbms_sql.last_row_count', NULL, FALSE);
    END IF;

    p_cursor_id := NULL;
EXCEPTION
    -- Effective userid (OID) changed since solution initialization
    WHEN insufficient_privilege THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';
END;
$function$
LANGUAGE plpgsql;