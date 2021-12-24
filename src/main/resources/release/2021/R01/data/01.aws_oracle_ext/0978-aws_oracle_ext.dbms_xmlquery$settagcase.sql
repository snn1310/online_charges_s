create or replace function aws_oracle_ext.dbms_xmlquery$setTagCase(ctxHdl numeric, tCase numeric)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxTagCase constant text = 'ctxTagCase';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when tCase is null then CtxTagCase else null end],
                                                        ctxTagCase => tCase
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$
