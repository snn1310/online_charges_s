CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_get_message(pvqueueurl text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
	/*receive message*/
	LambdaArn constant varchar(250) := aws_oracle_ext.sqs_lu_inited_funcarn('GET_MESSAGE');
	QueueUrl constant varchar(30) := 'QueueUrl';
	lvJSON text;
	lvResult text;
begin
	lvJSON = json_object(array_agg(QueueUrl), array_agg(pvQueueUrl));
	lvResult = aws_oracle_ext.sqs_aa_lambda_payload(LambdaArn, lvJSON);
	return lvResult;
end;
$function$
