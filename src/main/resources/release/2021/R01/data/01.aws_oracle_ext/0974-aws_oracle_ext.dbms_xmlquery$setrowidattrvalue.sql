create or replace function aws_oracle_ext.dbms_xmlquery$setRowidAttrValue(ctxHdl numeric, colName text default null)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxRowidAttrValue constant text = 'ctxRowidAttrValue';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when colName is null then CtxRowidAttrValue else null end],
                                                        ctxRowidAttrValue => colName
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$