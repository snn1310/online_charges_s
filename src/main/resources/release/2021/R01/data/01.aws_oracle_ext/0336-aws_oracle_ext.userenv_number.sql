create or replace function aws_oracle_ext.USERENV_NUMBER(in parameter CHARACTER VARYING) returns int as
$BODY$
begin
  if upper(parameter) = ('SESSIONID') then
    return pg_backend_pid();
  else 
    /*another  calls with the COMMITSCN and ENTRYID parameters have no analogs in PostgreSQL*/
    return NULL;
  end if;
end;
$BODY$
LANGUAGE plpgsql;