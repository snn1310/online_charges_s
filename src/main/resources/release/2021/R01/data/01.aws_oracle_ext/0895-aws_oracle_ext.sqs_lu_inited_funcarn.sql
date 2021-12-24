CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_inited_funcarn(pvaction text)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE
AS $function$
	select f.Arn
	  from aws_oracle_ext.sqs_functions_settings f
	 where f.fAction = pvAction
	;
$function$
