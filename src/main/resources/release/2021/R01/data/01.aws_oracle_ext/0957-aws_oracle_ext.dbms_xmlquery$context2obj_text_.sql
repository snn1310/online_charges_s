create or replace function aws_oracle_ext.dbms_xmlquery$context2obj(ctxValue text)
 returns aws_oracle_ext.dbms_xmlquery$TContext
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select * from json_populate_record(null::dbms_xmlquery$TContext, ctxValue::json) $$
;
