create or replace function aws_oracle_ext.dbms_xmlgen$context2text(ctxValue aws_oracle_ext.dbms_xmlgen$TContext)
 returns text
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select row_to_json(ctxValue)::text $$
;
