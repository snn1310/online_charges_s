CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_insert_queue_table(queue_table_record json, msg_record json)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
USER_DATA text = 'json_populate_record(null::%s.%s, %s)';
TABLE_DDL  text = 'INSERT INTO %s.%s ('
						'q_name, msgid, corrid, '
						'priority, state, delay, '
						'expiration, time_manager_info, local_order_no, '
						'chain_no, cscn, dscn, '
						'enq_time, enq_uid, enq_tid, '
						'deq_time, deq_uid,  deq_tid, '
						'retry_count, exception_qschema, exception_queue, '
						'step_no, recipient_key, dequeue_msgid, '
						'sender_name, sender_address, sender_protocol, '
						'user_data, user_prop'
						')'
						'VALUES ( '
							'%s, %s::bytea, null, '
							'0, 0, null, '
							'null, null, 0, '
							'0, 0, 0, '
							'now(), current_user, txid_current() , '
							'null, null, null, '
							'0, null, null, '
							'0, 0, null::bytea, '
							'null, null, 0, '
							'%s, null'
							')';

lrT aws_oracle_ext.sqs_queues_tables%rowtype;
lrM aws_oracle_ext.sqs_queue_record;
begin
	lrT := json_populate_record(lrT, queue_table_record);
 	lrM := json_populate_record(lrM, msg_record);

	USER_DATA := format(USER_DATA, lrT.tdatatypeschema, lrT.tdatatypename, quote_literal(lrM.user_data));
	TABLE_DDL := format(TABLE_DDL, lrT.tschema, lrT.tname, quote_literal(lrM.q_name), quote_literal(lrM.msgid), USER_DATA);

	EXECUTE TABLE_DDL;
end;
$function$
