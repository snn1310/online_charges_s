CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_default_error()
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE
AS $function$select 'ERROR.Something gone wrong!'$function$;
