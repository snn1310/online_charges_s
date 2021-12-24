create or replace function aws_oracle_ext.dbms_session$set_nls(in param character varying, in val character varying) returns void as
$BODY$
begin
  perform  aws_oracle_ext.set_extpack_variable
   (
      variable_name => upper(param), 
      variable_value => val
   ); 
	
	
  if upper(param) = 'NLS_LANGUAGE' then
   
    perform  aws_oracle_ext.set_extpack_variable
     (
        variable_name => 'NLS_DATE_LANGUAGE', 
        variable_value => val
     );    

    
    perform  aws_oracle_ext.set_extpack_variable
     (
        variable_name => 'NLS_SORT', 
        variable_value => val
     );    
    
  end if;
END;
$BODY$
LANGUAGE plpgsql
VOLATILE RETURNS NULL ON NULL INPUT;