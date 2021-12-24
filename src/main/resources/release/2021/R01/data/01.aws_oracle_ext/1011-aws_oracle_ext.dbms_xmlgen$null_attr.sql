create or replace function aws_oracle_ext.dbms_xmlgen$null_attr()
returns integer
 language sql
 immutable
as $$ select 1 $$;