create or replace function aws_oracle_ext.dbms_xmlgen$setSkipRows(ctx numeric, skipRows numeric)
 returns void
 language plpgsql
as $$
declare
	CtxSkipRows constant text = 'ctxSkipRows';
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
	lnCtxHdl int := trunc(ctx);
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := aws_oracle_ext.dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                                         forceParamList => array[case when skipRows is null then CtxSkipRows else null end],
                                                                         ctxSkipRows => skipRows
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