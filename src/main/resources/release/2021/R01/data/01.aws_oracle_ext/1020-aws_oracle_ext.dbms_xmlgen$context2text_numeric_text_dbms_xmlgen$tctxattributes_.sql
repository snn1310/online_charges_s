create or replace function aws_oracle_ext.dbms_xmlgen$context2text(ctxHdl numeric,
                                                                   ctxCursor refcursor,
                                                                   ctxQuery text,
                                                                   ctxAttributes aws_oracle_ext.dbms_xmlgen$TctxAttributes default null,
                                                                   ctxNumRowsProcessed int default null
                                                                  )
 returns text
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select dbms_xmlgen$context2text((ctxHdl,
                                       ctxCursor,
                                       ctxQuery,
                                       coalesce(ctxAttributes, dbms_xmlgen$contextAttr2obj()),
                                       ctxNumRowsProcessed
                                       )::dbms_xmlgen$TContext)::text $$
;