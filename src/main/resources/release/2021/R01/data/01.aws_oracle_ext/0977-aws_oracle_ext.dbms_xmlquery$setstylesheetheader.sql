create or replace function aws_oracle_ext.dbms_xmlquery$setStyleSheetHeader(ctxHdl numeric, uri text, type text default 'text/xsl')
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxStyleSheetHeader constant text = 'ctxStyleSheetHeader';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when uri is null then CtxStyleSheetHeader else null end],
                                                        ctxStyleSheetHeader => ROW(uri, type)::dbms_xmlquery$tctxdictionary
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$