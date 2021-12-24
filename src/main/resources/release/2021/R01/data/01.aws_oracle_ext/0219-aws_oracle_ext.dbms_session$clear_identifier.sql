CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$clear_identifier()
 RETURNS void
 LANGUAGE plpgsql
 SET client_min_messages TO 'error'
AS $function$
begin
  perform aws_oracle_ext.set_extpack_variable
    (
	  variable_name => 'CLIENT_IDENTIFIER', 
	  variable_value => null::text
	);
END;
$function$
;