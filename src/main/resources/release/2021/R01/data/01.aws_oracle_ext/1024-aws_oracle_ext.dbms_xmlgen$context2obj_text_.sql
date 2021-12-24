create or replace function aws_oracle_ext.dbms_xmlgen$context2obj(ctxValue text)
 returns aws_oracle_ext.dbms_xmlgen$TContext
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select * from json_populate_record(null::dbms_xmlgen$TContext, ctxValue::json) $$
;
