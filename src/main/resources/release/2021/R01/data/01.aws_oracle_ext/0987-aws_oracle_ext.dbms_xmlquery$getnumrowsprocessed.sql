create or replace function aws_oracle_ext.dbms_xmlquery$getNumRowsProcessed(ctxHdl numeric)
 returns numeric
 language plpgsql
 set search_path = 'aws_oracle_ext'
as $$
begin

	return 0;
    
end; $$