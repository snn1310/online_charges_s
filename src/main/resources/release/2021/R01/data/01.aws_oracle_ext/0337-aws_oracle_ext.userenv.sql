create or replace function aws_oracle_ext.USERENV(in parameter CHARACTER VARYING) returns CHARACTER VARYING as
$BODY$
begin
  if upper(parameter) in ('ISDBA', 'LANG', 'LANGUAGE', 'CLIENT_INFO', 'TERMINAL') then
  return aws_oracle_ext.SYS_CONTEXT_USERENV(parameter);
  else raise EXCEPTION 'invalid USERENV parameter';  
  end if;
end;
$BODY$
LANGUAGE plpgsql
RETURNS NULL ON NULL INPUT;