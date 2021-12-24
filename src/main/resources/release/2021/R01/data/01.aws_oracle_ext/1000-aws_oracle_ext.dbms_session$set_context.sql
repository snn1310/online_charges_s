CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$set_context
(
  namespace character varying, 
  attribute character varying, 
  value character varying, 
  username character varying DEFAULT NULL::character varying, 
  client_id character varying DEFAULT NULL::character varying
)
 RETURNS void
 LANGUAGE plpgsql
 SET client_min_messages TO 'error'
AS $function$
DECLARE
  l_key text;
  l_context_type text; 
  l_crypted text;
  l_interval text;
  l_namespace text;
  l_attribute text;
BEGIN
  if namespace is null or attribute is null then 
    raise exception 'invalid input values';  
  end if; 
  
  
  l_namespace := aws_oracle_ext.format_identifier_case(namespace);
  l_attribute := aws_oracle_ext.format_identifier_case(attribute);
  
  if l_namespace = 'CLIENTCONTEXT' then 
    perform  aws_oracle_ext.set_extpack_variable
                                (
                                 variable_name => l_namespace||'_'||l_attribute, 
                                 variable_value => value
                                );
  else 
   	perform aws_oracle_ext.init_context_struct();  
    l_key := aws_oracle_ext.get_context_param('key');  
    l_context_type := aws_oracle_ext.get_context_type(l_namespace);   
    l_crypted := crypt(value || ':' || l_key, gen_salt('bf'));   
 	
   	
   	case upper(l_context_type) 
	  	when 'ACCESSED LOCALLY' then 
	  		begin
				insert into context_local(
				  context_namespace, 
				  attribute_name, 
				  attribute_value, 
				  user_name, 
				  cliend_id, 
				  signature
				)
				values (
				  l_namespace, 
				  l_attribute, 
				  $3, 
				  $4, 
				  coalesce($5, aws_oracle_ext.sys_context_userenv('CLIENT_IDENTIFIER')), 
				  l_crypted
				) 
				on conflict (context_namespace, attribute_name) do 
				update set 
					attribute_value = excluded.attribute_value,
					signature = excluded.signature;
		  	end;
	  	when 'ACCESSED GLOBALLY' then	  
	  		begin
					
				delete from aws_oracle_context.context_global 
			    where backend_start <= now()::timestamp - (coalesce(aws_oracle_ext.get_context_param('auto_clean_interval'), '1 day'))::interval;

				insert into aws_oracle_context.context_global(
				  context_namespace, 
				  attribute_name, 
				  attribute_value, 
				  user_name, 
				  cliend_id, 
				  signature
				)
				values (
				  l_namespace, 
				  l_attribute, 
				  $3, 
				  $4, 
				  coalesce($5, aws_oracle_ext.sys_context_userenv('CLIENT_IDENTIFIER')), 
				  l_crypted
				) 
				on conflict (context_namespace, attribute_name, cliend_id) do 
				update set 
					attribute_value = excluded.attribute_value,
					signature = excluded.signature;
		  	end;  
	  	else 
			-- INITIALIZED EXTERNALLY, INITIALIZED GLOBALLY  	
	  		raise exception 'unsupported context type: %', l_context_type;
	  end case;    
  end if;
 
  exception 
    when no_data_found then raise exception 'Context % is not found', l_namespace;  
END;
$function$
;

