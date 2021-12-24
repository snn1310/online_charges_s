create or replace function aws_oracle_ext.dbms_xmlgen$ctxIdx(ctxHdl numeric)
 returns character varying
 language sql
 immutable
 set search_path to 'aws_oracle_ext'
as $$ select ctxIdx from dbms_xmlgen$ctxHdl2uidRec(ctxHdl) as (Idx numeric, ctxIdx character varying) $$
;
