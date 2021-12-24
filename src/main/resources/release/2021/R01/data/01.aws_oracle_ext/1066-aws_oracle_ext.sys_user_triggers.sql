create or replace
view aws_oracle_ext.sys_user_triggers as
select
	trg.tgname::character varying(128) as TRIGGER_NAME,
	case
		trg.tgtype::integer & 66
		when 2 then 'BEFORE'||
			case trg.tgtype::integer & 1
				when 1 then ' EACH ROW'
				else 'STATEMENT'
			end
		when 64 then 'INSTEAD OF'
		else 'AFTER'||
			case trg.tgtype::integer & 1
				when 1 then ' EACH ROW'
				else 'STATEMENT'
			end
	end::character varying(16) as TRIGGER_TYPE,
	case
		trg.tgtype::integer & cast(28 as int2)
		when 32 then 'TRUNCATE'
		when 16 then 'UPDATE'
		when 8 then 'DELETE'
		when 4 then 'INSERT'
		when 20 then 'INSERT OR UPDATE'
		when 28 then 'INSERT OR UPDATE OR DELETE'
		when 24 then 'UPDATE OR DELETE'
		when 12 then 'INSERT OR DELETE'
	end::character varying(246) as TRIGGERING_EVENT,
	ns.nspname::character varying(128) as TABLE_OWNER,
	case
		trg.tgtype::integer & 66
		when 64 then 'VIEW' -- for INSTEAD OF
		else 'TABLE'
	end::character varying(18) as BASE_OBJECT_TYPE,
	tbl.relname::character varying(128) as TABLE_NAME,
	(select string_agg(a.attname,', ') from pg_attribute a where a.attrelid = tbl.oid and a.attnum = ANY(trg.tgattr))::character varying(4000) as COLUMN_NAME,
	'REFERENCING NEW AS NEW OLD AS OLD'::character varying(422) as REFERENCING_NAMES,
	case
    	when pg_has_role(tbl.relowner, 'USAGE'::text) then (regexp_match(pg_get_triggerdef(trg.oid), '.{35,} WHEN \((.+)\) EXECUTE PROCEDURE'::text))[1]
        else NULL::text
    end::character varying(4000) as WHEN_CLAUSE,
	case
		when trg.tgenabled = 'D' then 'DISABLED'
		else 'ENABLED'
	end::character varying(8) as STATUS,
	obj_description(trg.oid)::character varying(400) as DESCRIPTION,
	'PL/SQL'::character varying(11) as ACTION_TYPE,
	n.nspname || '.' || proc.proname::text as TRIGGER_BODY,
	'NO'::character varying(3) as CROSSEDITION,
	'NO'::character varying(3) as BEFORE_STATEMENT,
	'NO'::character varying(3) as BEFORE_ROW,
	'NO'::character varying(3) as AFTER_ROW,
	'NO'::character varying(3) as AFTER_STATEMENT,
	'NO'::character varying(3) as INSTEAD_OF_ROW,
	case
		trg.tgtype::integer & 66
		when 2 then 'YES'
		when 64 then 'NO'
		else 'YES'
	end::character varying(3) as FIRE_ONCE,
	'NO'::character varying(3) as APPLY_SERVER_ONLY
from pg_trigger trg
join pg_proc proc 				on	proc.oid = trg.tgfoid
join pg_catalog.pg_namespace n	on	n.oid = proc.pronamespace
join pg_class tbl				on	trg.tgrelid = tbl.oid
join pg_namespace ns			on	ns.oid = tbl.relnamespace
join pg_user u 					on  u.usesysid = tbl.relowner
where not trg.tgisinternal
	and u.usename = USER;

COMMENT ON VIEW aws_oracle_ext.sys_user_triggers IS 'USER_TRIGGERS describes the triggers owned by the current user.';
