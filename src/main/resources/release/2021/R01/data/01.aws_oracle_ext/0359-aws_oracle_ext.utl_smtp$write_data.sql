/*
Subprogram to replace UTL_SMTP.write_data
*/
create or replace function aws_oracle_ext.utl_smtp$write_data
  ( in c aws_oracle_ext.utl_smtp$connection, in data character varying )
  returns void
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  insert into utl_smtp$new_message( msg_body ) values( data );

  return;
end;
$$ language plpgsql;