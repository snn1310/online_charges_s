CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_context
(
  namespace character varying, 
  attribute character varying, 
  username character varying default null, 
  client_id character varying default null
)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
declare 
  v_res character varying;
  l_namespace text;
  l_attribute text;

begin
  
  l_namespace := aws_oracle_ext.format_identifier_case(namespace);
  l_attribute := aws_oracle_ext.format_identifier_case(attribute);
  
  case l_namespace
    when 'USERENV' then 
      v_res = aws_oracle_ext.SYS_CONTEXT_USERENV(l_attribute);
    when 'CLIENTCONTEXT'  then 
     v_res = aws_oracle_ext.get_extpack_variable(variable_name => l_namespace||'_'||l_attribute)::character varying; 
  else 
    v_res = aws_oracle_ext.get_application_context(l_namespace, l_attribute, username, client_id);
  end case;

  return v_res;
  
  exception 
    when internal_error then return null; 
end;
$function$
;
