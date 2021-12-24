create or replace function aws_oracle_ext.dbms_xmlquery$all_rows()
returns integer
 language sql
 immutable
as $$ select -1 $$;