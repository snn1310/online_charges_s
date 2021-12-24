CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aqadm$drop_queue"(queue_name text, auto_commit boolean DEFAULT true)
 RETURNS void
 LANGUAGE plpgsql
 SET SCHEMA 'aws_oracle_ext'
AS $function$
declare
	lResult text;
begin
	lResult := sqs_aq_delete_queue(sqs_lu_inited_queueurl(queue_name));
	perform sqs_lu_delete_queue_table(queue_name);
end;
$function$
