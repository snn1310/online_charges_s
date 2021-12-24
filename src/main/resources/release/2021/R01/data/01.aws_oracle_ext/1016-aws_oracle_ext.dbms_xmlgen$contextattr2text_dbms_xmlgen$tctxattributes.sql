create or replace function aws_oracle_ext.dbms_xmlgen$contextAttr2text(ctxAttrValue aws_oracle_ext.dbms_xmlgen$TctxAttributes)
 returns text
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select row_to_json(ctxAttrValue)::text $$
;