create or replace function aws_oracle_ext.dbms_xmlgen$useItemTagsForColl(ctx numeric)
 returns void
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	CtxUseItemTagsForColl constant text = 'ctxUseItemTagsForColl';
	lnCtxHdl int := trunc(ctx);
	lCtx dbms_xmlgen$tContext;
begin
	lCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => lnCtxHdl);

    if not lCtx is null then
        lCtx.ctxAttributes := dbms_xmlgen$setCtxAttrValue(ctxAttributes => lCtx.ctxAttributes,
                                                          forceParamList => array[CtxUseItemTagsForColl],
                                                          ctxUseItemTagsForColl => true
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
