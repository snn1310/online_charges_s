CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$read_module(module_name out character varying, action_name out character varying)
 LANGUAGE plpgsql
AS $function$
declare l_app_name jsonb;
begin
  execute 'show application_name' into strict l_app_name;	 
  module_name := l_app_name->>'module';
  action_name := l_app_name->>'action';
  exception 
    when invalid_text_representation then 
      begin
        module_name := null;
        action_name := null;	      
      end;  
end;
$function$;
