create or replace function aws_oracle_ext.dbms_xmlquery$setRowSetTag(ctxHdl numeric, tag text)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxAttrName constant text = 'ctxRowSetTag';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when tag is null then CtxAttrName else null end],
                                                        ctxRowSetTag => tag
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$