CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_delete_queue_message(queue text, msgid text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
DELETE_DDL  text = 'DELETE FROM %s.%s t'
						' WHERE t.q_name = %s and'
						' t.msgid = %s';

lrT aws_oracle_ext.sqs_queues_tables%rowtype;
begin
	lrT := aws_oracle_ext.sqs_lu_inited_queuetbl(pvname := queue);
	DELETE_DDL := format(DELETE_DDL, lrT.tschema, lrT.tname, quote_literal(queue), quote_literal(msgid));

	EXECUTE DELETE_DDL;
end;
$function$
