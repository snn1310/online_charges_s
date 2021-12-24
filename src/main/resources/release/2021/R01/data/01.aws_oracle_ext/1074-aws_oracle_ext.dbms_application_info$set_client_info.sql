CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$set_client_info
(
  client_info character varying
)
 RETURNS void
 LANGUAGE sql
AS $function$
  select aws_oracle_ext.set_extpack_variable
    (
	  variable_name => 'CLIENT_INFO', 
	  variable_value => client_info
	);  
$function$;
