create or replace function aws_oracle_ext.dbms_lock$request(id bigint, --lockhandle VARCHAR,
   lockmode          INTEGER DEFAULT 6 /* X_MODE = Exclusive */,
   timeout           INTEGER DEFAULT 32767 /*MAXWAIT*/,
   release_on_commit BOOLEAN DEFAULT FALSE)
  RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
  l_getlock boolean := true;
  l_result  int;
BEGIN
    /* lockmode is implemented only for values
     *   6 - Exclusive
     *   not 6 - Shared
     *
     * timeout is implemented only for values
     *   0 - no wait
     *   not 0 - wait untill free
     */
    perform aws_oracle_ext.set_package_variable('aws_oracle_ext', 'dbms_lock', concat('lockmode_', id), lockmode);

    case when not release_on_commit and lockmode = 6 and timeout = 0 then l_getlock := pg_try_advisory_lock(id);
         when not release_on_commit and lockmode = 6 and timeout != 0 then perform pg_advisory_lock(id);
         when not release_on_commit and lockmode != 6 and timeout = 0 then l_getlock := pg_try_advisory_lock_shared(id);
         when not release_on_commit and lockmode != 6 and timeout != 0 then perform pg_advisory_lock_shared(id);
         when release_on_commit and lockmode = 6 and timeout = 0 then l_getlock := pg_try_advisory_xact_lock(id);
         when release_on_commit and lockmode = 6 and timeout != 0 then perform pg_advisory_xact_lock(id);
         when release_on_commit and lockmode != 6 and timeout = 0 then l_getlock := pg_try_advisory_xact_lock_shared(id);
         when release_on_commit and lockmode != 6 and timeout != 0 then perform pg_advisory_xact_lock_shared(id);
         else l_getlock := false;
    end case;

    l_result := case when l_getlock then 0 -- Success
                     else 1 -- Timeout
                end;
    return l_result;
END;
$function$