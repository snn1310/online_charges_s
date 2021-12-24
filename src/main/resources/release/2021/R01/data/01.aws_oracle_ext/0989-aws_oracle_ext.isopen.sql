create or replace function aws_oracle_ext.isopen(p_cursor_name VARCHAR)
returns BOOLEAN
as
$BODY$
BEGIN
  RETURN EXISTS(SELECT 1 FROM pg_cursors WHERE name = lower(p_cursor_name));
END;
$BODY$ 
language plpgsql;