CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_queue_fifo()
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE
AS $function$select 'fifo'$function$;
