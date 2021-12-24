CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_next_message()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 3$function$;
