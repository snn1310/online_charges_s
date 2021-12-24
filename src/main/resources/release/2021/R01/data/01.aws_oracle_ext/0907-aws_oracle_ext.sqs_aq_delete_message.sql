CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_delete_message(pvqueueurl text, pvreceipthandle text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
	/*delete message*/
	LambdaArn constant varchar(4000) := aws_oracle_ext.sqs_lu_inited_funcarn('DELETE_MESSAGE');
	QueueUrl constant varchar(30) := 'QueueUrl';
	ReceiptHandle constant varchar(30) := 'ReceiptHandle';
	Service constant varchar(30) := 'sqs';
	lvJSON text;
	lvResult text;
begin
	with q (key, value) as (values (QueueUrl, pvQueueUrl), (ReceiptHandle, pvReceiptHandle)
	       )
    select json_object(array_agg(key), array_agg(value))
      into lvJSON
     from q;

    lvResult = aws_oracle_ext.sqs_aa_lambda_payload(LambdaArn, lvJSON);

    return lvResult;
end;
$function$;