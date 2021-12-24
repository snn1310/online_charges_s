create or replace function aws_oracle_ext.dbms_xmlquery$db_encoding()
returns character varying
 language sql
 immutable
as $$ select '_' $$;