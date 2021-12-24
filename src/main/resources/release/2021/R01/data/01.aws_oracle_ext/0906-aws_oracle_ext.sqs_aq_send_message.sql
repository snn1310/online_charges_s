CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_send_message(pvqueueurl text, pvmessagebody text)
 RETURNS text
 LANGUAGE plpgsql
 SET SCHEMA 'aws_oracle_ext'
AS $function$
declare
	QueueUrl constant varchar(30) := 'QueueUrl';
	MessageBody constant varchar(30) := 'MessageBody';
	LambdaArn constant varchar(250) := sqs_lu_inited_funcarn('SEND_MESSAGE');
	lvJSON text;
	lvResult text;
begin
	with q (key, value) as (values (QueueUrl, pvQueueUrl), (MessageBody, pvMessageBody)
	       )
    select json_object(array_agg(key), array_agg(value))
      into lvJSON
     from q;

    lvResult = sqs_aa_lambda_payload(LambdaArn, lvJSON);

    return lvResult;
end;
$function$