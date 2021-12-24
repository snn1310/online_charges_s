CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_delete_queue_table(pvqueuename text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
begin
	DELETE FROM aws_oracle_ext.sqs_queues_settings WHERE qname = pvqueuename;
end;
$function$
