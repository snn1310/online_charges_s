CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_drop_queue_table(pvtablename text, pvschemaname text DEFAULT ''::text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
	lvSchemaName text := coalesce(nullif(pvschemaname, ''), current_schema());
	lvTableName text := pvtablename;
	UNREGISTER_TABLE text := 'DELETE FROM aws_oracle_ext.sqs_queues_tables WHERE tschema = %s and tname = %s';
	TABLE_DDL  text := 'DROP TABLE %s.%s';
	EXECUTE_BLOCK text := '%s;'
	                      '%s;';
	lnQueueRegistered int;
begin

  select count(1)
    into lnQueueRegistered
	from aws_oracle_ext.sqs_vw_queues_settings q
	where q.tschema = lvSchemaName
      and q.tname = lvTableName;

    if lnQueueRegistered = 0 then
		UNREGISTER_TABLE := format(UNREGISTER_TABLE, quote_literal(lvSchemaName),quote_literal(pvTableName));
		TABLE_DDL := format(TABLE_DDL, lvSchemaName, pvTableName);
		EXECUTE_BLOCK := format(EXECUTE_BLOCK, UNREGISTER_TABLE, TABLE_DDL);
		EXECUTE EXECUTE_BLOCK;
	else
		raise exception '%', aws_oracle_ext.sqs_default_error();
	end if;

end;
$function$
