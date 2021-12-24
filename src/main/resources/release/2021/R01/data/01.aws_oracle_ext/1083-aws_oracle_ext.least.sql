CREATE OR REPLACE FUNCTION aws_oracle_ext.least(VARIADIC anyarray)
 RETURNS anyelement
 LANGUAGE sql
 AS $function$
  SELECT unnest($1)
  ORDER BY 1 ASC NULLS FIRST
  LIMIT 1;
$function$;