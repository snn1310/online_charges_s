CREATE OR REPLACE FUNCTION aws_oracle_ext.get_context_param(a_param_name character varying)
 RETURNS character varying
 LANGUAGE plpgsql
 SET client_min_messages TO 'error'
AS $function$
begin
	/*Params:
	 * 'key' - secret key for the crypt calls
	 * 'auto_clean_interval' - an interval for context_global auto cleaning*/	
  return (select param_value 
 			from aws_oracle_context.params 
 			where param_name = a_param_name);  
end;	
$function$;