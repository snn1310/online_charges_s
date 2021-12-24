CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_create_queue(pvqueuename text, pvqueueattributes text DEFAULT aws_oracle_ext.sqs_default_queue_attributes())
 RETURNS text
 LANGUAGE plpgsql
 SET SCHEMA 'aws_oracle_ext'
AS $function$
declare
	/*create queue*/
	LambdaArn constant varchar(250) := aws_oracle_ext.sqs_lu_inited_funcarn('CREATE_QUEUE');
	QueueName constant varchar(30) := 'QueueName';
	lvJSON text;
	lvResult text;
begin
	--
	if pvQueueName = '' then
		raise exception 'invalid value NULL, QUEUE_NAME should be defined'
		using hint  = 'Please check your user Queue name';
	end if;

	with q as (select key, pvQueueName as value
	             from json_each_text(pvQueueAttributes::json)
	            where lower(key) = lower(QueueName)
	           union all
	           select key, value
	             from json_each_text(pvQueueAttributes::json)
	            where lower(key) != lower(QueueName))
	select json_object(array_agg(key), array_agg(value))::text
	  into lvJSON
	 from (
	       select QueueName as key, pvQueueName as value
	       where not exists (select 1 from q where lower(key) = lower(QueueName))
			union all
		  select key, value from q
			) a;

	lvResult = aws_oracle_ext.sqs_aa_lambda_payload(LambdaArn, lvJSON);
	return lvResult;
end;
$function$
