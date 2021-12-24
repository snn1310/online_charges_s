create or replace function aws_oracle_ext.dbms_xmlgen$default_rowsettag()
returns character varying
 language sql
 immutable
as $$ select 'ROWSET' $$;