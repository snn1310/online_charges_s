CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_lu_define_table(pvtablename text, OUT ovschemaname text, OUT ovtablename text)
 RETURNS record
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
	ovtablename := coalesce(nullif(split_part(lower(pvtablename), '.', 2), ''), lower(pvtablename));

	if lower(pvtablename) = ovtablename then
		ovschemaname = current_schema();
	else
		ovschemaname := split_part(lower(pvtablename), '.', 1);
	end if;
end;
$function$
