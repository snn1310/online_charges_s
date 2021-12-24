create or replace function aws_oracle_ext.dbms_lock$request(lockhandle character varying,
                                                            lockmode           INTEGER DEFAULT 6 /* X_MODE = Exclusive */,
                                                            timeout            INTEGER DEFAULT 32767 /*MAXWAIT*/,
                                                            release_on_commit  BOOLEAN DEFAULT FALSE)
RETURNS bigint
LANGUAGE sql
AS $function$
    select aws_oracle_ext.dbms_lock$request(id => aws_oracle_ext.get_id_by_name(lockhandle::text),
                                            lockmode => lockmode,
                                            timeout => timeout,
                                            release_on_commit => release_on_commit
                                            );
$function$;