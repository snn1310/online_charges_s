CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_delete_queue(pvqueueurl text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
	/*delete queue*/
	LambdaArn constant varchar(250) := aws_oracle_ext.sqs_lu_inited_funcarn('DELETE_QUEUE');
	QueueUrl constant varchar(30) := 'QueueUrl';
	AttributeNames constant varchar(30) := 'AttributeNames';
	lvJSON text;
	lvResult text;
begin
	lvJSON = json_object(array_agg(QueueUrl), array_agg(pvQueueUrl));
	lvResult = aws_oracle_ext.sqs_aa_lambda_payload(LambdaArn, lvJSON);
	return lvResult;
end;
$function$
