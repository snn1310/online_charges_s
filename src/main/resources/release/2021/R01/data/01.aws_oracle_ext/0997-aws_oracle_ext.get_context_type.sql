CREATE OR REPLACE FUNCTION aws_oracle_ext.get_context_type(a_context_namespace character varying)
 RETURNS character varying
 LANGUAGE SQL
 IMMUTABLE
 PARALLEL SAFE
 RETURNS NULL ON NULL INPUT
AS $function$
  select upper(context_type) 
 			from aws_oracle_context.context 
 			where context_namespace = $1;  
$function$;