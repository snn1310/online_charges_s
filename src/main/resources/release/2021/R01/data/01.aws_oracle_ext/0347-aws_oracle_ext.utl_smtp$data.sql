/*
Subprogram to replace UTL_SMTP.data
 */
create or replace function aws_oracle_ext.utl_smtp$data
  ( in c aws_oracle_ext.utl_smtp$connection, in body character varying )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin

  insert into utl_smtp$new_message( msg_body ) values( body );

  l_reply.code := 250;
  l_reply.text := 'Requested mail action okay, completed';

  return l_reply;
end;
$$ language plpgsql;