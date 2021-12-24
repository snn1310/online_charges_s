CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_insert_func_arn(pvaction text, pvfunctionname text, pvarn text)
 RETURNS character varying
 LANGUAGE sql
AS $function$
	with d (action_, functionname, arn) as
			  (select upper(pvaction) , lower(pvfunctionname) , lower(pvarn)
				where upper(pvaction) = any ('{DELETE_QUEUE,SEND_MESSAGE,DELETE_MESSAGE,CREATE_QUEUE,GET_MESSAGE,INIT_QUEUES}')
 		  		  and lower(pvfunctionname) = split_part(lower(pvarn), ':', 7)
 		  		  and pvfunctionname != ''
 		  		  and pvarn != ''
 	          )
	insert into aws_oracle_ext.sqs_functions_settings select action_, functionname, arn from d
	on conflict(faction) do
		update set fname = lower(pvfunctionname),
		           arn = lower(pvarn)
	returning fname;
$function$
