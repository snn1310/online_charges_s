/*
Subprogram to replace UTL_SMTP.starttls
*/
create or replace function aws_oracle_ext.utl_smtp$starttls
  ( in c aws_oracle_ext.utl_smtp$connection )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  l_reply.code := 220;
  l_reply.text := 'Go ahead';
  return l_reply;
end;
$$ language plpgsql;