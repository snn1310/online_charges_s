CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aq$enqueue"(queue_name text, enqueue_options json, message_properties json, payload json, OUT msgid bytea)
 RETURNS bytea
 LANGUAGE plpgsql
 SET SCHEMA 'aws_oracle_ext'
AS $function$
declare
	lvResponse text;
	lQueueUrl text;
	lrT sqs_queues_tables%rowtype;
	lrM sqs_queue_record;
begin

	lrT :=  sqs_lu_inited_queuetbl(queue_name);

	if lrT.id = -1 then
		lQueueUrl := sqs_lu_inited_queueurl(queue_name);

		lvResponse := sqs_aq_send_message(lQueueUrl, payload::text);

		msgid := trim(both '"' from json_extract_path(json_extract_path(lvResponse::json, 'body')::json, 'MessageId')::text)::bytea;

		lrM.msgid := msgid;
		lrM.q_name := queue_name;
		lrM.user_data = payload;

		perform sqs_lu_insert_queue_table(to_json(lrT), to_json(lrM));
	end if;
end;
$function$
