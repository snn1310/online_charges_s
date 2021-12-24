create or replace function aws_oracle_ext.dbms_lock$release(lockhandle CHARACTER VARYING)
returns bigint
as
$BODY$
    select aws_oracle_ext.dbms_lock$release(id => aws_oracle_ext.get_id_by_name(lockhandle::text));
$BODY$
language sql
returns null on null input;