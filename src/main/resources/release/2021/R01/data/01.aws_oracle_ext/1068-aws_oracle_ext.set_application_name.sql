CREATE OR REPLACE FUNCTION aws_oracle_ext.set_application_name(p_app_name jsonb)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
begin
  	execute 'set application_name = ' || quote_ident(p_app_name::json::text);
end;
$function$;