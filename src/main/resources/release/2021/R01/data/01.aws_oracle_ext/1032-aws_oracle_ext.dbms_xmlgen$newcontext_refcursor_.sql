create or replace function aws_oracle_ext.dbms_xmlgen$newcontext(queryString refcursor) returns numeric
language plpgsql
as $$
begin
	return aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl => null,
			                                      ctxCursor => queryString,
			                                      ctxQuery => null,
			                                      ctxAttributes => null,
			                                      ctxNumRowsProcessed => null
			                                     );
end; $$