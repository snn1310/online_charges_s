create or replace function aws_oracle_ext.dbms_xmlgen$getctxobj(ctxHdl numeric)
 returns aws_oracle_ext.dbms_xmlgen$tContext
 language plpgsql
as $$
begin
	if ctxHdl < 0  then
		raise exception 'XML processing error. Nagative value [%] was readed', ctxHdl using hint = '22063';
	end if;

	return aws_oracle_ext.dbms_xmlgen$context2obj(ctxHdl => trunc(ctxHdl));

end; $$