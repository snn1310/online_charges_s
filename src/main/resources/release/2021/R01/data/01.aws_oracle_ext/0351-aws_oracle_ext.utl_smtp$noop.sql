/*
Subprogram to replace UTL_SMTP.noop
 */
create or replace function aws_oracle_ext.utl_smtp$noop
  ( in c aws_oracle_ext.utl_smtp$connection )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  l_reply.code := 250;
  l_reply.text := 'Requested mail action okay, completed';
  return l_reply;
end;
$$ language plpgsql;