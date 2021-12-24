create or replace function aws_oracle_ext.dbms_xmlgen$ctxHdl2uidRec(ctxHdl numeric)
 returns record
 language sql
 immutable
as $$ select ctxHdl, concat('dbms_xmlgen$context_query_', coalesce(trunc(ctxHdl)::text, '')) $$
;