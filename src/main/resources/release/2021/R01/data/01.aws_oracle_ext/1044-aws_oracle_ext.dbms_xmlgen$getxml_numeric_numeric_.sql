create or replace function aws_oracle_ext.dbms_xmlgen$getXML(ctx numeric, dtdOrSchema numeric default aws_oracle_ext.dbms_xmlgen$none())
 returns text
 language plpgsql
as $$
declare
    lCtx aws_oracle_ext.dbms_xmlgen$tContext;
    lnCtxHdl int := trunc(ctx);
    lvReturn text;
    lrResult record;
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

	if lCtx is null then
	    raise exception 'Invalid context or doesn''t exists' using hint = '19019';
	else
		lrResult := aws_oracle_ext.dbms_xmlgen$qc2xml(pvSQL => lCtx.ctxQuery,
	                                                  pCr => lCtx.ctxCursor,
	                                                  pnMaxRows => (lCtx.ctxAttributes).ctxMaxRows,
	                                                  pvRowsetTag => (lCtx.ctxAttributes).ctxRowsettag,
	                                                  pvRowTag => (lCtx.ctxAttributes).ctxRowTag,
	                                                  pnSkipRows => (lCtx.ctxAttributes).ctxSkipRows
	                                                 );

	    perform aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl => lCtx.ctxIdx,
	                                                   ctxCursor => lCtx.ctxCursor,
	                                                   ctxQuery => lCtx.ctxQuery,
	                                                   ctxAttributes => lCtx.ctxAttributes,
	                                                   ctxNumRowsProcessed => lrResult.pnRowCount,
	                                                   forceSetValues => true
	                                                  );

	    lvReturn := xmlserialize(document lrResult.pxXML as text
                                );
	end if;

	return lvReturn;
end; $$