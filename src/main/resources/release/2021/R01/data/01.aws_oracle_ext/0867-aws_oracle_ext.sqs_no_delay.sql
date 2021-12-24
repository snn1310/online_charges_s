CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_no_delay()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 0$function$;
