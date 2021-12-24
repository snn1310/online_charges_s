create or replace function aws_oracle_ext.dbms_xmlgen$dtd()
returns integer
 language sql
 immutable
as $$ select 1 $$;