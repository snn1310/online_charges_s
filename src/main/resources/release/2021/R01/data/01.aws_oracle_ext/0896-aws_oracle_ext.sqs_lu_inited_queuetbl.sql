CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_inited_queuetbl(pvname text)
 RETURNS aws_oracle_ext.sqs_queues_tables
 LANGUAGE plpgsql
AS $function$
declare
	lrT aws_oracle_ext.sqs_queues_tables%rowtype;
	lnTID integer;
begin

	select -1 id, tschema, tname, tdatatypeschema, tdatatypename
	  into lrT
	  from aws_oracle_ext.sqs_vw_queues_settings q
	 where q.qName = pvName
	;

	if lrT.Id is null or lrT.tname is null or lrT.tdatatypename is null then

	   select tableid
	   	 into lnTID
		 from aws_oracle_ext.sqs_queues_settings s
		where s.qname = pvname;

		if lnTID is null then
			raise exception '% does not exist or does not define', pvname
			using hint  = '-24010';
		else
			raise exception 'invalid value. Queue table or type does not exist or does not define for queue %', pvname
			using hint  = '-24000';
		end if;

	end if;

	return lrT;
end;
$function$
;