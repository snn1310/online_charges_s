create or replace function aws_oracle_ext.DBMS_SESSION$IS_SESSION_ALIVE(uniqueid integer) returns boolean as
$BODY$
BEGIN
  return ((select state from pg_stat_activity where pid = uniqueid) = 'active'::text);
END;
$BODY$
LANGUAGE plpgsql
VOLATILE RETURNS NULL ON NULL INPUT;
