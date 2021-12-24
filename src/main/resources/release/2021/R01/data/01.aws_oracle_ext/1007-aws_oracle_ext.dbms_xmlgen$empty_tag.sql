create or replace function aws_oracle_ext.dbms_xmlgen$empty_tag()
returns integer
 language sql
 immutable
as $$ select 2 $$;