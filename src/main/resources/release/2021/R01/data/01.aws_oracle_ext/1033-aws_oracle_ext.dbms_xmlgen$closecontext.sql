create or replace function aws_oracle_ext.dbms_xmlgen$closecontext(ctx numeric) returns void
language plpgsql
as $$
declare
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
	lnCtxHdl int := trunc(ctx);
begin
    lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        perform aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl => lCtx.ctxIdx,
                                                       ctxCursor => null,
                                                       ctxQuery => null,
                                                       ctxAttributes => null,
                                                       ctxNumRowsProcessed => null
                                                      );
    end if;
end; $$