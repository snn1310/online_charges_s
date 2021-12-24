CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_queue_body()
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE
AS $function$select 'body'$function$;
