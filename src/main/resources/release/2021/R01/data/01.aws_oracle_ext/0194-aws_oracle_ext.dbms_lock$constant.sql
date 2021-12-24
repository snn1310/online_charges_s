CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_lock$constant"(p_const_name text)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE
AS $function$
declare l_consts jsonb = json_build_object(
                                              -- DBMS_LOCK Constants - Lock mode
                                              'NL_MODE',1,
                                              'SS_MODE',2,
                                              'SX_MODE',3,
                                              'S_MODE',4,
                                              'SSX_MODE',5,
                                              'X_MODE',6,
                                              -- MAXWAIT
                                              'MAXWAIT',32767
                                          );
begin
	if l_consts ?  upper(p_const_name) then
		return (l_consts->>upper(p_const_name))::integer;
	else
		raise exception 'Unknown DBMS_LOCK constant: %', p_const_name;
	end if;
end $function$;