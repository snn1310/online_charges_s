create or replace function aws_oracle_ext.dbms_xmlgen$schema()
returns integer
 language sql
 immutable
as $$ select 2 $$;