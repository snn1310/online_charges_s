CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$clear_all_context(namespace character varying)
 RETURNS void
 LANGUAGE sql
 SET client_min_messages TO 'error'
AS $function$
  select aws_oracle_ext.dbms_session$clear_context($1);
$function$
; 
