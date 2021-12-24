CREATE OR REPLACE FUNCTION aws_oracle_ext.get_application_name()
 RETURNS jsonb
 LANGUAGE plpgsql
AS $function$
declare 
  l_res jsonb;
begin
  execute 'show application_name' into strict l_res;
  return l_res;
 
  exception when others then 
	return jsonb_build_object('action'::text, 'init'::text);
end;
$function$;