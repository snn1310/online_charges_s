CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aqadm$create_queue"(queue_name text, queue_table text, queue_type integer DEFAULT aws_oracle_ext.sqs_normal_queue(), max_retries double precision DEFAULT NULL::double precision, retry_delay double precision DEFAULT 0, retention_time double precision DEFAULT 0, dependency_tracking boolean DEFAULT false, comment text DEFAULT NULL::text, auto_commit boolean DEFAULT true)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
	USER_DATA constant text = 'user_data';
	lResult json;
	lrQ aws_oracle_ext.sqs_queues_settings%rowtype;
	lrT aws_oracle_ext.sqs_queues_tables%rowtype;
	lStatusCode varchar(200);
begin

	select ovschemaname, ovtablename
	  into lrT.tschema, lrT.tname
	  from aws_oracle_ext.sqs_lu_define_table(queue_table);

	with q as (select u.table_schema,
					  u.table_name,
					  u.udt_schema,
					  u.udt_name
			     from information_schema.tables t join information_schema.column_udt_usage u on t.table_schema = u.table_schema
				                                                                            and t.table_name  = u.table_name
				 where t.table_schema = lrT.tschema
				   and t.table_name = lrT.tname
				   and u.column_name = USER_DATA
			   )
	 select t.id,
	        q.udt_schema,
	        q.udt_name,
	   into lrT.id
	   		lrT.tdatatypeschema,
	   		lrT.tdatatypename
      from aws_oracle_ext.sqs_queues_tables t join q on t.tschema = q.table_schema
								     and t.tname = q.table_name
								     and t.tdatatypeschema = q.udt_schema
								     and t.tdatatypename =q.udt_name;


	if lrT.id is null then
		raise exception 'invalid value NULL, QUEUE_TABLE should be defined'
		using hint  = 'Please check your user Queue table';
	end if;

	lResult := aws_oracle_ext.sqs_aq_create_queue(pvqueuename => queue_name)::json;
	lStatusCode := json_extract_path(lResult, 'statusCode');

	if lStatusCode::int = 200 then
		lrQ.Url := trim(both '"' from json_extract_path(lResult, 'QueueUrl')::text);
		lrQ.QPureName := reverse(split_part(reverse(lrQ.Url), '/',1));
		lrQ.QName := lrQ.QPureName;

		lrQ.QType := substr(lrQ.QPureName, length(lrQ.QPureName) - 3, 4);

		if lrQ.QType = aws_oracle_ext.sqs_queue_fifo() then
			lrQ.QName := replace(lrQ.QName, concat('.', aws_oracle_ext.sqs_queue_fifo()), '');
		end if;

		if lower(substring(lrQ.Url, 1, 8)) = 'https://' then
			lrQ.Arn := concat('arn:', replace(substring(lrQ.Url, 9), '/', ':'));
		end if;

		insert into aws_oracle_ext.sqs_queues_settings(qname, qpurename, url, arn, qtype, tableid)
		      select lrQ.qname, lrQ.qpurename, lrQ.url, lrQ.arn, lrQ.qtype, lrT.id;
	end if;
end;
$function$
