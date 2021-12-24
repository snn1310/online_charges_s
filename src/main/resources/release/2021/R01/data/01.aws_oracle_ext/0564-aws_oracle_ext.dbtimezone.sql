CREATE OR REPLACE FUNCTION aws_oracle_ext.dbtimezone()
RETURNS CHARACTER VARYING
AS 
$BODY$
begin  
	
  return aws_oracle_ext.get_extpack_variable(variable_name => 'TIME_ZONE', missing_ok => false); 
 
  exception 
     when internal_error then 
	   return coalesce(CURRENT_SETTING('TIMEZONE', TRUE), 'UTC');   
end;       
$BODY$
STABLE
LANGUAGE plpgsql;
