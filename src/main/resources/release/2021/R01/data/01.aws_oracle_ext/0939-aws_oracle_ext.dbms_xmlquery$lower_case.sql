create or replace function aws_oracle_ext.dbms_xmlquery$lower_case()
returns integer
 language sql
 immutable
as $$ select 1 $$;