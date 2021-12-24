create or replace function aws_oracle_ext.dbms_xmlquery$setSQLToXMLNameEscaping(ctxHdl numeric, flag boolean default true)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxSQLToXMLNameEscaping constant text = 'ctxSQLToXMLNameEscaping';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when flag is null then CtxSQLToXMLNameEscaping else null end],
                                                        ctxSQLToXMLNameEscaping => flag
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$