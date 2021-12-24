create or replace function aws_oracle_ext.dbms_xmlquery$none()
returns integer
 language sql
 immutable
as $$ select 0 $$;