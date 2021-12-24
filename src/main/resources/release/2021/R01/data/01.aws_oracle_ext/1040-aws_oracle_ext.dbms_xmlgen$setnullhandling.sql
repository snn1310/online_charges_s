create or replace function aws_oracle_ext.dbms_xmlgen$setNullHandling(ctx numeric, flag numeric)
 returns void
 language plpgsql
as $$
declare
	CtxNullHandling constant text = 'ctxNullHandling';
	lnCtxHdl int := trunc(ctx);
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := aws_oracle_ext.dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                                         forceParamList => array[case when flag is null then CtxNullHandling else null end],
                                                                         ctxNullHandling => flag
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