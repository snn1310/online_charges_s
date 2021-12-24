create or replace function aws_oracle_ext.dbms_xmlgen$default_rowtag()
returns character varying
 language sql
 immutable
as $$ select 'ROW' $$;