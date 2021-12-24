create or replace function aws_oracle_ext.DBMS_SESSION$IS_ROLE_ENABLED(in rolename character varying) returns boolean as
$BODY$
BEGIN
  return exists (select 1 from information_schema.enabled_roles where role_name = rolename);
END;
$BODY$
LANGUAGE plpgsql
VOLATILE RETURNS NULL ON NULL INPUT;