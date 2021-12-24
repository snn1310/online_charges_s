create type aws_oracle_ext.dbms_xmlquery$TContext as (ctxIdx int,
                                                      ctxQuery text,
                                                      ctxAttributes aws_oracle_ext.dbms_xmlquery$TctxAttributes
                                                     );