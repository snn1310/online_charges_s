create or replace function aws_oracle_ext.dbms_xmlquery$setDataHeader(ctxHdl numeric, header text default null, tag text default null)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxDataHeader constant text = 'ctxDataHeader';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when header is null then CtxDataHeader else null end],
                                                        ctxDataHeader => ROW(header, coalesce(tag, dbms_xmlquery$default_dataheadertag()))::dbms_xmlquery$tctxdictionary
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$