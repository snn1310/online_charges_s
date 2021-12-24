create or replace function aws_oracle_ext.dbms_xmlgen$setRowSetTag(ctx numeric, rowSetTagName text)
 returns void
 language plpgsql
as $$
declare
	CtxAttrName constant text = 'ctxRowSetTag';
	lCtx aws_oracle_ext.dbms_xmlgen$tContext;
	lnCtxHdl int := trunc(ctx);
    lbCtxExists boolean;
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := aws_oracle_ext.dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                                         forceParamList => array[case when rowSetTagName is null then CtxAttrName else null end],
                                                                         ctxRowSetTag => rowSetTagName
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