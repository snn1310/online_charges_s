create type aws_oracle_ext.dbms_xmlgen$TContext as (ctxIdx int,
                                                    ctxCursor refcursor,
                                                    ctxQuery text,
                                                    ctxAttributes aws_oracle_ext.dbms_xmlgen$TctxAttributes,
                                                    ctxNumRowsProcessed int
                                                   );