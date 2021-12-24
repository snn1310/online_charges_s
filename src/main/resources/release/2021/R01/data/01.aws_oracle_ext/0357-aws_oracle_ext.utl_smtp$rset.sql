/*
Subprogram to replace UTL_SMTP.rset
*/
create or replace function aws_oracle_ext.utl_smtp$rset
  ( in c aws_oracle_ext.utl_smtp$connection )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin

  delete from utl_mail$recipients;

  delete from utl_mail$new_message;

  l_reply.code := 250;
  l_reply.text := 'Requested mail action okay, completed';
  return l_reply;

end;
$$ language plpgsql;