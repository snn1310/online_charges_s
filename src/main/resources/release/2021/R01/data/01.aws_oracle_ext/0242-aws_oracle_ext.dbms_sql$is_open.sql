CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$is_open(IN p_cursor_id INTEGER)
RETURNS BOOLEAN
AS
$function$
BEGIN
    -- Checking if cursor metadata (JSON) exists, thus cursor is opened
    RETURN nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', p_cursor_id), TRUE), '') IS NOT NULL;
END;
$function$
LANGUAGE plpgsql;