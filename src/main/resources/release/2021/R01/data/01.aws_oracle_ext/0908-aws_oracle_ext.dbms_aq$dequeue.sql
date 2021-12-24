CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aq$dequeue"(queue_name text, dequeue_options json, OUT message_properties json, OUT payload json, OUT msgid bytea)
 RETURNS record
 LANGUAGE plpgsql
AS $function$
declare
	lvqueueurl text;
	lvreceipthandle text;
begin
	lvqueueurl := aws_oracle_ext.sqs_lu_inited_queueurl(queue_name);

	select receipthandle, messageid, body, null::json
	  into lvreceipthandle, msgid, payload, message_properties
	  from aws_oracle_ext.sqs_aq_get_messages_body(lvqueueurl);
	/*default dequeue_mode REMOVE*/
	if  lvreceipthandle is null then
		raise exception 'timeout or end-of-fetch during message dequeue from %', queue_name
		using hint  = '-25228'; --'ora_code must be here';
	else
		perform aws_oracle_ext.sqs_aq_delete_message(lvqueueurl, lvreceipthandle);
		perform aws_oracle_ext.sqs_lu_delete_queue_message(queue_name, msgid::text);
 	end if;
end;
$function$
