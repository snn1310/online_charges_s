CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_aqadm$create_queue_table"(queue_table text, queue_payload_type text, storage_clause text DEFAULT NULL::text, sort_list text DEFAULT NULL::text, multiple_consumers boolean DEFAULT false, message_grouping integer DEFAULT aws_oracle_ext.sqs_none(), comment text DEFAULT NULL::text, auto_commit boolean DEFAULT true, primary_instance integer DEFAULT 0, secondary_instance integer DEFAULT 0, compatible integer DEFAULT NULL::integer, secure boolean DEFAULT false)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
	lrT aws_oracle_ext.sqs_queues_tables%rowtype;
begin

	select lower(a.ovschemaname), lower(a.ovtablename)
	  into lrT.tschema, lrT.tname
 	from aws_oracle_ext.sqs_lu_define_table(queue_table) a;

	select lower(a.ovschemaname), lower(a.ovtypename)
	  into lrT.tdatatypeschema, lrT.tdatatypename
 	from aws_oracle_ext.sqs_lu_define_type(queue_payload_type) a;

	perform aws_oracle_ext.sqs_lu_create_queue_table(pvtablename := lrT.tname,
                                                      pvtypename := lrT.tdatatypename,
                                                      pvtableschema :=lrT.tschema,
                                                      pvtypeschema := lrT.tdatatypeschema
                                                     );
end;
$function$
