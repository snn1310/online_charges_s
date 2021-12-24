CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$set_module(module_name text, action_name text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare l_app_name jsonb;
begin
    l_app_name := aws_oracle_ext.get_application_name();

    l_app_name := jsonb_set(l_app_name, 
   							'{module}', 
   							coalesce(to_json(module_name),'null')::jsonb, 
   							true);
    
    l_app_name := jsonb_set(l_app_name, 
   							'{action}', 
   							coalesce(to_json(action_name),'null')::jsonb, 
   							true);
    perform aws_oracle_ext.set_application_name(l_app_name);
end;   
$function$;