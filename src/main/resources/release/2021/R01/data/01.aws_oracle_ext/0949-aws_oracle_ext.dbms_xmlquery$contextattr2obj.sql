create or replace function aws_oracle_ext.dbms_xmlquery$contextAttr2obj(ctxAttr text default null)
 returns aws_oracle_ext.dbms_xmlquery$TctxAttributes
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select *
        from json_populate_record(null::dbms_xmlquery$TctxAttributes,
                                  coalesce(ctxAttr, dbms_xmlquery$contextAttr2text())::json
                                 ) $$
;
