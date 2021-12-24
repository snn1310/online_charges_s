CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_persistent()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$select 1$function$;
