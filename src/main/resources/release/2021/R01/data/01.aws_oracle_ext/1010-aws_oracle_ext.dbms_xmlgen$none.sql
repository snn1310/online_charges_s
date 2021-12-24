create or replace function aws_oracle_ext.dbms_xmlgen$none()
returns integer
 language sql
 immutable
as $$ select 0 $$;