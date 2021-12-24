/*
Subprogram to replace UTL_SMTP.helo
*/
create or replace function aws_oracle_ext.utl_smtp$helo
  ( in c aws_oracle_ext.utl_smtp$connection, in domain character varying )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin
  l_reply.code := 250;
  l_reply.text := 'Hello ' || domain;
  return l_reply;
end;
$$ language plpgsql;