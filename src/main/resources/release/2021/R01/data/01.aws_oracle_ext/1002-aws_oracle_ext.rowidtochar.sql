CREATE OR REPLACE FUNCTION aws_oracle_ext.rowidtochar(p_rowid aws_oracle_data.rowid)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
   SELECT p_rowid::text;
$function$;