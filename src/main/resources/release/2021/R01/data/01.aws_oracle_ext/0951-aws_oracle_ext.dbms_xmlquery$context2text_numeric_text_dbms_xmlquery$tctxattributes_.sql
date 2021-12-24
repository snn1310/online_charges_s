create or replace function aws_oracle_ext.dbms_xmlquery$context2text(ctxHdl numeric,
                                                                     ctxQuery text,
                                                                     ctxAttributes aws_oracle_ext.dbms_xmlquery$TctxAttributes default null
                                                                    )
 returns text
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select dbms_xmlquery$context2text((ctxHdl,
                                         ctxQuery,
                                         coalesce(ctxAttributes, dbms_xmlquery$contextAttr2obj()
                                        )
                                       )::dbms_xmlquery$TContext)::text $$
;