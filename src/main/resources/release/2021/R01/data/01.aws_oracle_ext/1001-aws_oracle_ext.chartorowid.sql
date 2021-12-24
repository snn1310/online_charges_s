CREATE OR REPLACE FUNCTION aws_oracle_ext.chartorowid(pchar text)
 RETURNS aws_oracle_data.rowid
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
    SELECT pchar::aws_oracle_data.rowid;
$function$;

