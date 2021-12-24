create or replace view aws_oracle_ext.sys_all_policies as
select 
	p.schemaname::character varying(128) as OBJECT_OWNER,
	p.tablename::character varying(128) as OBJECT_NAME,
	'SYS_DEFAULT'::character varying(128) as POLICY_GROUP,
	p.policyname::character varying(128) as POLICY_NAME,
	p.schemaname::character varying(128) as PF_OWNER,
	null::character varying(128) as PACKAGE,
	null::character varying(128) as FUNCTION,
	case 
		when p.cmd in ('ALL','SELECT') then 'YES'
		else 'NO'
	end::character varying(3) as SEL,
	case 
		when p.cmd in ('ALL','INSERT') then 'YES'
		else 'NO'
	end::character varying(3) as INS,
	case 
		when p.cmd in ('ALL','UPDATE') then 'YES'
		else 'NO'
	end::character varying(3) as UPD,
	case 
		when p.cmd in ('ALL','DELETE') then 'YES'
		else 'NO'
	end::character varying(3) as DEL,
	'NO'::character varying(3) as IDX,
	case
		when p.with_check is not null then 'YES'
		else 'NO'
	end::character varying(3) as CHK_OPTION,
	'YES'::character varying(3) as ENABLE,
	'NO'::character varying(3) as STATIC_POLICY,
	'DYNAMIC'::character varying(24) as POLICY_TYPE,
	'NO'::character varying(3) as LONG_PREDICATE,
	'NO'::character varying(3) as COMMON,
	'NO'::character varying(3) as INHERITED
from pg_policies p
join pg_tables t on t.schemaname = p.schemaname and t.tablename = p.tablename
join pg_user u on u.usename = t.tableowner
where (pg_has_role(t.tableowner, 'USAGE'::text)
	or has_table_privilege(u.usesysid, 'SELECT, INSERT, UPDATE, DELETE'::text));

COMMENT ON VIEW aws_oracle_ext.sys_all_policies IS 'ALL_POLICIES describes all Oracle Virtual Private Database (VPD) security policies for objects accessible to the current user.';
