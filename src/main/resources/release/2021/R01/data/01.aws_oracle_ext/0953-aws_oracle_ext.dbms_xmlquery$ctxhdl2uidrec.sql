create or replace function aws_oracle_ext.dbms_xmlquery$ctxHdl2uidRec(ctxHdl numeric)
 returns record
 language sql
 immutable
as $$ select ctxHdl, concat('dbms_xmlquery$context_query_', coalesce(ctxHdl::text, '')) $$
;