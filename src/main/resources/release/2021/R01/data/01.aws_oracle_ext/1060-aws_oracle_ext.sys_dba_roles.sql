create or replace view aws_oracle_ext.sys_dba_roles as
select r.rolname::character varying(128) as "role",
u.usesysid::bigint as role_id,
case coalesce(r.rolpassword,'')
	when '' then 'NO'
	else 'YES'
end::character varying(8) as password_required,
case coalesce(r.rolpassword,'')
	when '' then 'NONE'
	else 'PASSWORD'
end::character varying(11) as authentication_type,
'NO'::character varying(3) as common,
'N'::character varying(1) as oracle_maintained,
'NO'::character varying(3) as inherited,
'NO'::character varying(3) as implicit
from pg_authid r
join pg_user u on u.usename = r.rolname;

COMMENT ON VIEW aws_oracle_ext.sys_dba_roles IS 'DBA_ROLES lists all roles that exist in the database.';
