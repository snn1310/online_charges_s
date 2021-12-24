create or replace function aws_oracle_ext.dbms_xmlquery$default_dataheadertag()
returns character varying
 language sql
 immutable
as $$ select 'DOCUMENT' $$;