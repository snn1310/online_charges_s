create or replace function aws_oracle_ext.dbms_lock$allocate_unique(in lockname character varying, inout lockhandle character varying) returns character varying
 LANGUAGE plpgsql
AS $function$
BEGIN
    lockhandle := lower(lockname);
END;
$function$