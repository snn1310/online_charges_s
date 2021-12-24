/*
Subprogram to replace UTL_SMTP.open_data
*/
create or replace function aws_oracle_ext.utl_smtp$open_data
  ( in c aws_oracle_ext.utl_smtp$connection )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  l_reply.code := 354;
  l_reply.text := 'Start mail input end <CRLF>.<CRLF>';

  return l_reply;
end;
$$ language plpgsql;