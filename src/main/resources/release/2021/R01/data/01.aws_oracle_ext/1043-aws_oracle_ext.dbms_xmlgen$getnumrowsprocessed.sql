create or replace function aws_oracle_ext.dbms_xmlgen$GetNumRowsProcessed(ctx numeric)
 returns numeric
 language plpgsql
as $$
declare
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
	lnCtxHdl int := trunc(ctx);
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);
	return coalesce(lCtx.ctxNumRowsProcessed, 0);
end; $$