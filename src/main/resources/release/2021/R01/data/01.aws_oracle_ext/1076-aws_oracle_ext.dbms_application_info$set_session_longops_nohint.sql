CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_application_info$set_session_longops_nohint() RETURNS INTEGER
 LANGUAGE sql
AS 
$function$
  -- set_session_longops_nohint constant BINARY_INTEGER := -1;
  select -1
$function$;
