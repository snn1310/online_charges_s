create or replace function aws_oracle_ext.dbms_lock$release(id bigint)
  returns bigint
as
$BODY$
declare
  l_unlock boolean := true;
  l_exit_code int;
BEGIN
    if aws_oracle_ext.get_package_variable('aws_oracle_ext', 'dbms_lock', concat('lockmode_',id))::INTEGER=6 /* lockmode: X_MODE = Exclusive */ then
      l_unlock := pg_advisory_unlock(id);
    else
      l_unlock := pg_advisory_unlock_shared(id);
    end if;

    l_exit_code := case when l_unlock then 0 -- Success
                        else 5 -- Illegal lock handle
                end;
    return l_exit_code;
END;
$BODY$
language plpgsql
returns null on null input;