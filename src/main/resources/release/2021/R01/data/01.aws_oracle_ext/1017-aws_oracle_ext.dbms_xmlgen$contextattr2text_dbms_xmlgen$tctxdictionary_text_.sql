create or replace function aws_oracle_ext.dbms_xmlgen$contextAttr2text(
                                                        	ctxConvertSpecialChars boolean default null,
                                                            ctxMaxRows numeric default null,
                                                            ctxNullHandling numeric default null,
                                                            ctxRowsetTag text default null,
                                                            ctxRowTag text default null,
                                                            ctxSkipRows numeric default null,
                                                            ctxUseNullattributeIndicator bool default null,
                                                            ctxUseItemTagsForColl bool default null
	                                                  )
 returns text
 language sql
 set search_path to 'aws_oracle_ext'
as $$ select dbms_xmlgen$contextAttr2text((ctxConvertSpecialChars,
                                            ctxMaxRows,
                                            ctxNullHandling,
                                            coalesce(ctxRowSetTag, dbms_xmlgen$default_rowsettag()),
	                                        coalesce(ctxRowTag, dbms_xmlgen$default_rowtag()),
	                                        coalesce(ctxSkipRows, 0),
                                            ctxUseNullattributeIndicator,
                                            ctxUseItemTagsForColl
	                                      )::dbms_xmlgen$TctxAttributes)::text $$
;
