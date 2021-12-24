    create or replace function aws_oracle_ext.dbms_xmlgen$contextAttr2obj(ctxAttr text default null)
     returns aws_oracle_ext.dbms_xmlgen$TctxAttributes
     language sql
     set search_path to 'aws_oracle_ext'
    as $$ select *
            from json_populate_record(null::dbms_xmlgen$TctxAttributes,
                                      coalesce(ctxAttr, dbms_xmlgen$contextAttr2text())::json
                                     ) $$
    ;
