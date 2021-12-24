CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_define_type(pvtypename text, OUT ovschemaname text, OUT ovtypename text)
 RETURNS record
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
	select a.ovschemaname, a.ovtablename
	  into ovschemaname, ovtypename
 	from aws_oracle_ext.sqs_lu_define_table(pvtypename) a;
end;
$function$
