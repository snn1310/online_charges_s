CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_before()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 2$function$;
