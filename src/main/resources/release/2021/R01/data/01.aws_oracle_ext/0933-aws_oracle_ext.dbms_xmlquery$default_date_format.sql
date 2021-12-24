create or replace function aws_oracle_ext.dbms_xmlquery$default_date_format()
returns character varying
 language sql
 immutable
as $$ select 'MM/dd/yyyy HH:mm:ss' $$;