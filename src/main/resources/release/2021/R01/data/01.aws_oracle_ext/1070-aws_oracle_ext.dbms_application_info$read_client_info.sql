CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$read_client_info
(
  client_info out character varying
)
 RETURNS character varying
 LANGUAGE sql
AS $function$
  select aws_oracle_ext.get_extpack_variable(variable_name => 'CLIENT_INFO'); 
$function$;