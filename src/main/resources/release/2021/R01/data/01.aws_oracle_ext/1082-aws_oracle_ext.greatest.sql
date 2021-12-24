CREATE OR REPLACE FUNCTION aws_oracle_ext.greatest(VARIADIC anyarray)
 RETURNS anyelement
 LANGUAGE sql
 AS $function$
  SELECT unnest($1)
  ORDER BY 1 DESC NULLS FIRST
  LIMIT 1;
$function$;