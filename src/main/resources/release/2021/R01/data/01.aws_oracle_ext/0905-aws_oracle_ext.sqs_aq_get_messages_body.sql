CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aq_get_messages_body(pvqueueurl text)
 RETURNS TABLE(messageid character varying, receipthandle character varying, md5ofbody character varying, body text)
 LANGUAGE plpgsql
AS $function$
declare
	lvStatusCode text;
	lvResult json;
begin
	lvResult := aws_oracle_ext.sqs_aq_get_message(pvQueueUrl)::json;

	lvStatusCode := trim(both '"' from json_extract_path(lvResult, 'statusCode')::text);

	if lvStatusCode = '200' then
		return query
		select "MessageId" as MessageId, "ReceiptHandle" as ReceiptHandle, "MD5OfBody" as MD5OfBody, "Body" as Body
		from json_to_recordset(json_extract_path(lvResult, aws_oracle_ext.sqs_queue_body())
		                      ) as x("MessageId" varchar(250),
		                             "ReceiptHandle" varchar(4000),
		                             "MD5OfBody" varchar(250),
		                             "Body" text);

    else
	    return query
	    select null::varchar(250) as MessageId, null::varchar(4000) as ReceiptHandle,
	           null::varchar(250) as MD5OfBody, lvResult::text as Body;
    end if;
end;
$function$
