create or replace function aws_oracle_ext.dbms_xmlquery$setXSLTParam(ctxHdl numeric, name text, param text)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxXSLTParam constant text = 'ctxXSLTParam';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when name is null then CtxXSLTParam else null end],
                                                        ctxXSLTParam => ROW(name, param)::dbms_xmlquery$tctxdictionary
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$