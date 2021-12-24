create or replace function aws_oracle_ext.dbms_xmlquery$setDateFormat(ctxHdl numeric, mask text)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxAttrName constant text = 'ctxDateFormat';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := aws_oracle_ext.dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when mask is null then CtxAttrName else null end],
                                                        ctxDateFormat => mask
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$