CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_create_queue_table(pvtablename text, pvtypename text, pvtableschema text DEFAULT ''::text, pvtypeschema text DEFAULT ''::text)
 RETURNS void
 LANGUAGE plpgsql
 SET search_path TO 'aws_oracle_ext'
AS $function$
declare
	lrT aws_oracle_ext.sqs_queues_tables%rowtype;

	TABLE_DDL  text = 'CREATE TABLE %s.%s '
						'(q_name VARCHAR(61), '
						'msgid BYTEA, '
						'corrid VARCHAR(128), '
						'priority DOUBLE PRECISION, '
						'state DOUBLE PRECISION, '
						'delay TIMESTAMP (6) WITHOUT TIME ZONE, '
						'expiration DOUBLE PRECISION, '
						'time_manager_info TIMESTAMP (6) WITHOUT TIME ZONE, '
						'local_order_no DOUBLE PRECISION, '
						'chain_no DOUBLE PRECISION, '
						'cscn DOUBLE PRECISION, '
						'dscn DOUBLE PRECISION, '
						'enq_time TIMESTAMP (6) WITHOUT TIME ZONE, '
						'enq_uid VARCHAR(30), '
						'enq_tid VARCHAR(30), '
						'deq_time TIMESTAMP (6) WITHOUT TIME ZONE, '
						'deq_uid VARCHAR(30), '
						'deq_tid VARCHAR(30), '
						'retry_count DOUBLE PRECISION, '
						'exception_qschema VARCHAR(30), '
						'exception_queue VARCHAR(30), '
						'step_no DOUBLE PRECISION, '
						'recipient_key DOUBLE PRECISION, '
						'dequeue_msgid BYTEA, '
						'sender_name VARCHAR(30), '
						'sender_address VARCHAR(1024), '
						'sender_protocol DOUBLE PRECISION, '
						'user_data %s.%s, '
						'user_prop VARCHAR(8000), '
						'primary KEY (MSGID)'
						')';
	REGISTER_TABLE text = 'INSERT INTO aws_oracle_ext.sqs_queues_tables '
						  '(tschema, tname, tdatatypeschema, tdatatypename) '
						  'VALUES '
						  '(%s, %s, %s, %s)';
	EXECUTE_BLOCK text = '%s;'
				         '%s;';
begin
	lrT.tschema := lower(coalesce(nullif(pvTableSchema, ''), current_schema()));
	lrT.tname := lower(pvTableName);
	lrT.tdatatypeschema := lower(coalesce(nullif(pvTypeSchema, ''), current_schema()));
	lrT.tdatatypename := lower(pvTypeName);

	select t.user_defined_type_schema,
		   t.user_defined_type_name
	  into lrT.tdatatypeschema,
	       lrT.tdatatypename
	  from information_schema.user_defined_types t
	 where t.user_defined_type_schema = lrT.tdatatypeschema
	   and t.user_defined_type_name = lrT.tdatatypename;

	if nullif(lrT.tdatatypeschema, '') is not null and nullif(lrT.tdatatypename, '') is not null then

		TABLE_DDL := format(TABLE_DDL, lrT.tschema, lrT.tname, lrT.tdatatypeschema, lrT.tdatatypename);
		REGISTER_TABLE := format(REGISTER_TABLE, quote_literal(lrT.tschema), quote_literal(lrT.tname), quote_literal(lrT.tdatatypeschema), quote_literal(lrT.tdatatypename));

		EXECUTE_BLOCK := format(EXECUTE_BLOCK, TABLE_DDL, REGISTER_TABLE);

		EXECUTE EXECUTE_BLOCK;
	else
		raise exception '%', aws_oracle_ext.sqs_default_error();
	end if;
end;
$function$
