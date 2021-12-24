create or replace function aws_oracle_ext.dbms_xmlquery$setRowidAttrName(ctxHdl numeric, attrName text default null)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxRowidAttrName constant text = 'ctxRowidAttrName';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when attrName is null then CtxRowidAttrName else null end],
                                                        ctxRowidAttrName => attrName
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$