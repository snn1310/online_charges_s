create or replace function aws_oracle_ext.dbms_xmlquery$schema()
returns integer
 language sql
 immutable
as $$ select 2 $$;