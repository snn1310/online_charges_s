create or replace function aws_oracle_ext.dbms_xmlgen$useNullAttributeIndicator(ctx numeric, attrind boolean default true)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxUseNullAttributeIndicator constant text = 'ctxUseNullAttributeIndicator';
	lnCtxHdl int := trunc(ctx);
	lCtx dbms_xmlgen$tContext;
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                          forceParamList => array[case when attrind is null then CtxUseNullAttributeIndicator else null end],
                                                          ctxUseNullAttributeIndicator => attrind
                                                         );

        perform aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl => lCtx.ctxIdx,
                                                    ctxCursor => lCtx.ctxCursor,
                                                    ctxQuery => lCtx.ctxQuery,
                                                    ctxAttributes => lCtx.ctxAttributes,
                                                    ctxNumRowsProcessed => lCtx.ctxNumRowsProcessed,
                                                    forceSetValues => true
                                                   );
	end if;
end; $$
