CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$set_action(action_name character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare l_app_name jsonb;
begin
	l_app_name := jsonb_set(aws_oracle_ext.get_application_name(), 
   							'{action}', 
   							coalesce(to_json(action_name::text),'null')::jsonb, 
   							true);
    perform aws_oracle_ext.set_application_name(l_app_name);
end;
$function$;