/*
Subprogram to replace UTL_SMTP.auth
*/
create or replace function aws_oracle_ext.utl_smtp$auth
  ( in c aws_oracle_ext.utl_smtp$connection, in username character varying, in password character varying, in schemes character varying default 'CRAM-MD5' )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare
  l_result aws_oracle_ext.utl_smtp$reply;
begin
  l_result.code := 235;
  l_result.text := 'Authentication successful';
  return l_result;
end;
$$ language plpgsql;