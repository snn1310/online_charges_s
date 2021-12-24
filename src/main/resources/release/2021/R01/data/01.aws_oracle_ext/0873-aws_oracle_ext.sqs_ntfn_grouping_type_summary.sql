CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_ntfn_grouping_type_summary()
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$ select 1$function$;
