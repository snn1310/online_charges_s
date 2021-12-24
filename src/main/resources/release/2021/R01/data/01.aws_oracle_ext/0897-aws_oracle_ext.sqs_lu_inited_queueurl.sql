CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_inited_queueurl(pvname text)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE
AS $function$
	select q.Url
	  from aws_oracle_ext.sqs_queues_settings q
	 where q.qName = pvName
	;
$function$
