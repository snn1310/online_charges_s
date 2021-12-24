/*
Subprogram to replace UTL_SMTP.close_connection
 */
create or replace function aws_oracle_ext.utl_smtp$close_connection
  ( in c aws_oracle_ext.utl_smtp$connection )
  returns void
as
$$
begin

  drop table if exists utl_smtp$new_message;
  drop table if exists utl_smtp$recipients;
  drop table if exists utl_smtp$connection;

  return;
end;
$$ language plpgsql;