create or replace function aws_oracle_ext.dbms_xmlgen$setMaxRows(ctx numeric, maxRows numeric)
 returns void
 language plpgsql
as $$
declare
	CtxMaxRows constant text = 'ctxMaxRows';
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
	lnCtxHdl int := trunc(ctx);
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := aws_oracle_ext.dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                                         forceParamList => array[case when maxRows is null then CtxMaxRows else null end],
                                                                         ctxMaxRows => maxRows
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