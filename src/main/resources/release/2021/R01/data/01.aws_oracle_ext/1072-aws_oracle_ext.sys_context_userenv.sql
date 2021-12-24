CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_context_userenv(parameter character varying)
 RETURNS character varying
 LANGUAGE plpgsql
 STABLE STRICT
AS $function$
declare l_context json;
begin 
  case upper(parameter)
    when 'ACTION' then return (select action_name from aws_oracle_ext.dbms_application_info$read_module());
    when 'AUDITED_CURSORID' then return null;
    when 'AUTHENTICATED_IDENTITY' then return null;
    when 'AUTHENTICATION_DATA' then return null;
    when 'AUTHENTICATION_METHOD' then return null;
	when 'AUTHENTICATION_TYPE' then return null;
    when 'BG_JOB_ID' then return null;
    when 'CLIENT_IDENTIFIER' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'CLIENT_INFO' then return (select client_info from aws_oracle_ext.dbms_application_info$read_client_info());
    when 'CURRENT_BIND' then return null;
    when 'CURRENT_SCHEMA' then return current_schema::character varying;
    when 'CURRENT_SCHEMAID' then return null;
    when 'CURRENT_SQL' then return (select query from pg_stat_activity where pid = pg_backend_pid())::character varying;
    when 'CURRENT_SQL_LENGTH' then return char_length((select query from pg_stat_activity where pid = pg_backend_pid()))::character varying;
	when 'CURRENT_USER' then return current_user::character varying;
	when 'CURRENT_USERID' then return (select usesysid from pg_catalog.pg_user where usename = current_user limit 1)::character varying;	
    when 'DB_DOMAIN' then return null;
    when 'DB_NAME' then return current_database()::character varying;    
    when 'DB_UNIQUE_NAME' then return current_database()::character varying;        
    when 'ENTRYID' then return null;            
    when 'ENTERPRISE_IDENTITY' then return null;            
    when 'FG_JOB_ID' then return null;            
    when 'GLOBAL_CONTEXT_MEMORY' then return '0'::character varying;                
    when 'GLOBAL_UID' then return '0'::character varying; 
    when 'HOST' then return (select client_hostname from pg_stat_activity where pid = pg_backend_pid())::character varying;
    when 'IDENTIFICATION_TYPE' then return null;            
    when 'INSTANCE' then return null;            
    when 'INSTANCE_NAME' then return inet_server_addr()::character varying;           
    when 'IP_ADDRESS' then return inet_client_addr()::character varying;  
    when 'ISDBA'  then return (select usesuper from pg_catalog.pg_user where usename = user limit 1)::character varying;
    when 'LANG' then return (select pg_encoding_to_char(encoding) from pg_database where datname = current_database())::character varying;
    when 'LANGUAGE' then return (select datctype from pg_database where datname = current_database())::character varying;    
    when 'MODULE' then return (select module_name from aws_oracle_ext.dbms_application_info$read_module());            
    when 'NETWORK_PROTOCOL' then return null;                
    when 'NLS_CALENDAR' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'NLS_CURRENCY' then return aws_oracle_ext.get_extpack_variable(upper(parameter));
    when 'NLS_DATE_FORMAT' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'NLS_DATE_LANGUAGE' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'NLS_SORT' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'NLS_TERRITORY' then return aws_oracle_ext.get_extpack_variable(upper(parameter));     
    when 'OS_USER' then return null;            
    when 'POLICY_INVOKER' then return null;                
    when 'PROXY_ENTERPRISE_IDENTITY' then return null;            
    when 'PROXY_GLOBAL_UID' then return null;                
    when 'PROXY_USER' then return null;            
    when 'PROXY_USERID' then return null;                
    when 'SERVER_HOST' then  return inet_server_addr()::character varying;           
    when 'SERVICE_NAME' then return null;                
    when 'SESSION_USER' then return SESSION_USER::character varying;            
    when 'SESSION_USERID' then return (select usesysid from pg_catalog.pg_user where usename = user limit 1)::character varying;
    when 'SESSIONID' then return pg_backend_pid()::character varying;
    when 'SID' then return null;                
    when 'STATEMENTID' then return null;                
    when 'TERMINAL' then return null;                
    else raise exception 'invalid parameter';  
  end case;
  
  exception
    when internal_error then
      return null;
end;
$function$
;



