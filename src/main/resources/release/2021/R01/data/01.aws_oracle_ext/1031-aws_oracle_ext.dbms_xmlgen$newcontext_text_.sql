create or replace function aws_oracle_ext.dbms_xmlgen$newcontext(queryString text) returns numeric
language plpgsql
as $$
declare
begin
	return aws_oracle_ext.dbms_xmlgen$setctxvalue(ctxHdl => null,
			                                      ctxCursor => null,
			                                      ctxQuery => queryString,
			                                      ctxAttributes => null,
			                                      ctxNumRowsProcessed => null
			                                     );
end; $$
