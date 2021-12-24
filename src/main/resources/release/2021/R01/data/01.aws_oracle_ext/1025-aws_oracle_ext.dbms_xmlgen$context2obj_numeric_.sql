create or replace function aws_oracle_ext.dbms_xmlgen$context2obj(ctxHdl numeric)
 returns aws_oracle_ext.dbms_xmlgen$TContext
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select dbms_xmlgen$context2obj(get_extpack_variable(variable_name => dbms_xmlgen$ctxIdx(trunc(ctxHdl)))) $$
;
