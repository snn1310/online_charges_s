create or replace function aws_oracle_ext.dbms_xmlgen$entity_decode()
returns numeric
 language sql
 immutable
as $$ select 1::numeric $$;