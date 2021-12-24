create or replace function aws_oracle_ext.dbms_xmlquery$context2obj(ctxHdl numeric)
 returns aws_oracle_ext.dbms_xmlquery$TContext
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select dbms_xmlquery$context2obj(get_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl))) $$
;
