CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$define_column_long(IN p_cursor_id INTEGER,
                                                                      IN p_column_pos INTEGER)
RETURNS VOID
AS
$function$
BEGIN
    PERFORM aws_oracle_ext.dbms_sql$define_column(p_cursor_id,
                                                  p_column_pos,
                                                  ''::TEXT);
END;
$function$
LANGUAGE plpgsql;