/*
Subprogram to replace UTL_SMTP.ehlo
 */
create or replace function aws_oracle_ext.utl_smtp$ehlo
  ( in c aws_oracle_ext.utl_smtp$connection, in domain character varying )
  returns aws_oracle_ext.utl_smtp$replies
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  l_reply.code := 250;
  l_reply.text := '250-AUTH';
  return ARRAY[ l_reply ]::aws_oracle_ext.utl_smtp$replies;
end;
$$ language plpgsql; 