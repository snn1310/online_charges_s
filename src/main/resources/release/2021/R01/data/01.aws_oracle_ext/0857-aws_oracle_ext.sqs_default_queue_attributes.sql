CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_default_queue_attributes()
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$select '{"QueueName": "", "FifoQueue": "true", "Policy": ""}'$function$;
