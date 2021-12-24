create or replace function aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl numeric,
			                                                      ctxCursor refcursor,
			                                                      ctxQuery text,
			                                                      ctxAttributes aws_oracle_ext.dbms_xmlgen$TctxAttributes,
			                                                      ctxNumRowsProcessed int,
			                                                      forceSetValues boolean default false
			                                                     ) returns numeric
language plpgsql
as $$
declare
    CONTEXT_SEQUENCE constant text := 'dbms_xmlgen$context$sequence';
    lrCtxQuery record;
    lrCtx aws_oracle_ext.dbms_xmlgen$TContext;
    lvCtx text;
    lnIdx numeric := ctxHdl;
    lvCtxIdx varchar;
    lnCurrval int := 0;
begin
	if ctxHdl is null then
		lnCurrval := coalesce(nullif(aws_oracle_ext.get_extpack_variable(variable_name => CONTEXT_SEQUENCE, missing_ok => true), ''), '-1')::integer;
        begin
            lnCurrval := lnCurrval + 1;
            perform aws_oracle_ext.set_extpack_variable(variable_name => CONTEXT_SEQUENCE, variable_value => lnCurrval::text);
            select Idx, ctxIdx, aws_oracle_ext.dbms_xmlgen$context2text(Idx, ctxCursor, ctxQuery) ctx
              into lrCtxQuery
              from aws_oracle_ext.dbms_xmlgen$ctxHdl2uidRec(lnCurrval) as (Idx numeric, ctxIdx character varying);

            lnIdx := lrCtxQuery.Idx;
            lvCtxIdx := lrCtxQuery.ctxIdx;
            lvCtx := lrCtxQuery.ctx;
        end;
	elsif ctxHdl is not null and
	      ctxCursor is not null or
          ctxQuery is not null or
          ctxAttributes is not null or
          ctxNumRowsProcessed is not null then

	   if forceSetValues then
	       lrCtx.ctxIdx := ctxHdl;
		   lrCtx.ctxCursor := ctxCursor;
		   lrCtx.ctxQuery := ctxQuery;
		   lrCtx.ctxAttributes := ctxAttributes;
		   lrCtx.ctxNumRowsProcessed := ctxNumRowsProcessed;
	   else
	   	   lrCtx := aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl => ctxHdl);

		   if not lrCtx is null then
		   	   lrCtx.ctxCursor := coalesce(ctxCursor, lrCtx.ctxCursor);
			   lrCtx.ctxQuery := coalesce(ctxQuery, lrCtx.ctxQuery);
			   lrCtx.ctxAttributes := coalesce(ctxAttributes, lrCtx.ctxAttributes);
			   lrCtx.ctxNumRowsProcessed := coalesce(ctxNumRowsProcessed, lrCtx.ctxNumRowsProcessed);
		   end if; -- if not lrCtx is null then
	   end if; --  if forceSetValues then

	   lvCtxIdx := aws_oracle_ext.dbms_xmlgen$ctxIdx(ctxHdl);
	   lvCtx := aws_oracle_ext.dbms_xmlgen$context2text(lrCtx);
	else
		lvCtxIdx := aws_oracle_ext.dbms_xmlgen$ctxIdx(ctxHdl);
		lvCtx := null;
	end if;

    perform aws_oracle_ext.set_extpack_variable(variable_name => lvCtxIdx, variable_value => lvCtx);

    return lnIdx;
end; $$

