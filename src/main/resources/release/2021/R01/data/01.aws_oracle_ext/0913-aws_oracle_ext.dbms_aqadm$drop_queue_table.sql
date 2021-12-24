CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aqadm$drop_queue_table"(queue_table text, force boolean DEFAULT false, auto_commit boolean DEFAULT true)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
	lrT aws_oracle_ext.sqs_queues_tables%rowtype;
begin

	select lower(a.ovschemaname), lower(a.ovtablename)
	  into lrT.tschema, lrT.tname
 	from aws_oracle_ext.sqs_lu_define_table(queue_table) a;

	perform aws_oracle_ext.sqs_lu_drop_queue_table(pvtablename := lrT.tname, pvschemaname := lrT.tschema);
end;
$function$
