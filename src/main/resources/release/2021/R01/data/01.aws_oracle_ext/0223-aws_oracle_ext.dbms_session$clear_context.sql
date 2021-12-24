CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$clear_context
(
	namespace character varying, 
	client_id character varying default null, 
	attribute character varying default null
)
 RETURNS void
 LANGUAGE plpgsql
 SET client_min_messages TO 'error'
AS $function$
declare
  l_namespace text;
  l_attribute text;
begin	
   l_namespace := aws_oracle_ext.format_identifier_case(namespace);
   l_attribute := aws_oracle_ext.format_identifier_case(attribute);
  
   if l_namespace is null then 
   		raise exception 'input value for argument namespace is not valid';    
   end if;
  
  if l_namespace = 'CLIENTCONTEXT' then
    raise exception 'CLIENTCONTEXT namespace will be cleared automatically in the end of the session. Can not be cleared manually';    
  end if;
  
  case aws_oracle_ext.get_context_type(l_namespace) 
    when 'ACCESSED GLOBALLY' then 
    	delete from aws_oracle_context.context_global cg
    	where cg.context_namespace = l_namespace
    	and coalesce(cg.cliend_id, '') = coalesce($2, '')
    	and cg.attribute_name = coalesce(l_attribute, cg.attribute_name);         		        	
    when 'ACCESSED LOCALLY' then 
    	delete from context_local where context_namespace = l_namespace and coalesce(attribute_name, '') = coalesce(l_attribute, '');
    else raise exception 'Unsupported context type';   
  end case;
 
end;
$function$
;
