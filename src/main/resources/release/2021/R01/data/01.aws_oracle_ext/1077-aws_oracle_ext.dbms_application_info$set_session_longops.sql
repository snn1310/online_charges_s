CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$set_session_longops
(
	inout rindex integer,
	inout slno integer,
	op_name text default null,
	target integer default 0,
	context integer default 0,
	sofar integer default 0,
	totalwork integer default 0,
	target_desc text default 'unknown target',
	units text default null	
)
 LANGUAGE plpgsql
AS $function$
declare l_app_name jsonb;
begin
    l_app_name := jsonb_set(
    						aws_oracle_ext.get_application_name(), 
   							'{longops}', 
   							jsonb_build_object(
   								'rindex', rindex,
   								'slno', slno,
   								'op_name', op_name,
   								'target', target,
   								'context', context,
   								'sofar', sofar,
   								'totalwork', totalwork,
   								'target_desc', target_desc,
   								'units', units
   							), 
   							true);
    
    -- perform aws_oracle_ext.set_application_name(l_app_name); 
    -- value is TO LONG for application_name (max is 64)
    perform aws_oracle_ext.set_extpack_variable
	  (
	    variable_name => 'SESSION_LONGOPS', 
		variable_value => l_app_name::text
	  );  
end;   
$function$;
