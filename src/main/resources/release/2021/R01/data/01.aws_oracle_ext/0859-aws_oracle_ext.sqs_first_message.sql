CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_first_message()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 1$function$;
