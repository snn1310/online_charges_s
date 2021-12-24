CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_normal_queue()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 0$function$;
