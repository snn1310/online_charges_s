create or replace function aws_oracle_ext.dbms_xmlquery$setXSLT(ctxHdl numeric, uri varchar, ref text default null)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxXSLT constant text = 'ctxXSLT';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when uri is null then CtxXSLT else null end],
                                                        ctxXSLT => ROW(uri, ref)::dbms_xmlquery$tctxdictionary
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$