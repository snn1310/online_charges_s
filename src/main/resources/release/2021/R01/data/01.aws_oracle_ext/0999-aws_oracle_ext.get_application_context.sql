CREATE OR REPLACE FUNCTION aws_oracle_ext.get_application_context
(
  a_context_namespace character varying, 
  a_context_attribute character varying, 
  a_username character varying DEFAULT NULL::character varying, 
  a_client_id character varying DEFAULT NULL::character varying
)
 RETURNS character varying
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET client_min_messages TO 'notice'
AS $function$
DECLARE
  l_context_type text;
  l_key text;
  l_interval text;
  l_signature text;
  l_value character varying;
 
begin
  perform aws_oracle_ext.init_context_struct();
  l_key := aws_oracle_ext.get_context_param('key');
  l_context_type := aws_oracle_ext.get_context_type(a_context_namespace);

 
  case upper(l_context_type) 
  	when 'ACCESSED LOCALLY' then 
  		begin
			select cl.attribute_value, cl.signature 
			  into strict l_value, l_signature
			from context_local cl
			where cl.context_namespace = $1
			  and cl.attribute_name = $2
		  	  and (cl.user_name = $3 or cl.user_name is null)
		  	  and (cl.cliend_id = $4 or coalesce(cl.cliend_id, '') = '')
		    limit 1;	  		
	  	end;
  	when 'ACCESSED GLOBALLY' then	  
  		begin		
			delete from aws_oracle_context.context_global 
			where backend_start <= now()::timestamp - (coalesce(aws_oracle_ext.get_context_param('auto_clean_interval'), '1 day'))::interval;
		 	
			select w.attribute_value, w.signature 
			into strict l_value, l_signature 
			from (
				select 
					cg.attribute_value, 
					cg.signature,
					row_number() over (order by cg.context_namespace, cg.attribute_name, cg.cliend_id) as row
				from aws_oracle_context.context_global cg 
				where cg.context_namespace = $1
				  and cg.attribute_name = $2
				  and (cg.user_name = $3 or cg.user_name is null)
				  and (cg.cliend_id = $4 or coalesce(cg.cliend_id, '') = '')
				) w  
		    where row = 1;
	  	end;  
  	else 
		-- INITIALIZED EXTERNALLY, INITIALIZED GLOBALLY  	
  		raise exception 'unsupported context type: %', l_context_type;
  end case;
 
  if l_signature <> crypt(l_value || ':' || l_key, l_signature) then  
	raise exception  'The signature for %.% is broken', $1, $2;
  end if;	  	
  
  return l_value;
  exception 
 	when no_data_found then return null; 
end;
$function$
;
