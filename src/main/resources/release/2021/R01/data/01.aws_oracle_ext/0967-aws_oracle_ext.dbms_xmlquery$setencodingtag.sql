create or replace function aws_oracle_ext.dbms_xmlquery$setEncodingTag(ctxHdl numeric, enc text)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxEncodingTag constant text = 'ctxEncodingTag';
	lCtx dbms_xmlquery$tContext;
begin
	lCtx := aws_oracle_ext.dbms_xmlquery$context2obj(ctxHdl => ctxHdl);
	lCtx.ctxAttributes := dbms_xmlquery$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
	                                                    forceParamList => array[case when enc is null then CtxEncodingTag else null end],
                                                        ctxEncodingTag => enc
                                                       );

    perform set_extpack_variable(variable_name => dbms_xmlquery$ctxIdx(ctxHdl), variable_value => dbms_xmlquery$context2text(ctxValue => lCtx));
end; $$