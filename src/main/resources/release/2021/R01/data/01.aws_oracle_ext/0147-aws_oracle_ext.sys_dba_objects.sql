create or replace view aws_oracle_ext.SYS_DBA_OBJECTS as
select 
	n.nspname::varchar(30)  as OWNER
	, c.relname::varchar(30) as OBJECT_NAME 
	, cast (null as varchar(30)) as SUBOBJECT_NAME
	, c.oid::bigint as OBJECT_ID
	, case when c.relkind in ('t', 'r') then c.oid::bigint else cast(null as bigint) end as DATA_OBJECT_ID
	, case c.relkind 
		when 'r' then 'ordinary table'::varchar(17)
		when 'i' then 'index'::varchar(17)
		when 'S' then 'sequence'::varchar(17)
		when 'v' then 'view'::varchar(17)
		when 'c' then 'composite type'::varchar(17)
		when 't' then 'TOAST table'::varchar(17)
		when 'f' then 'foreign table'::varchar(17)
		else cast (null as varchar(17))
	end as OBJECT_TYPE
	/*the creation/modification dates information isn't recorded anywhere. 
	  To recive db creation date instead we must execute something like  
		SELECT (pg_stat_file('base/'||oid||'/PG_VERSION')).modification FROM pg_database where datname = 'schema_name';
	  Note: must be superuser to get file information*/
	, cast(null as date) as CREATED
	, cast(null as date) as LAST_DDL_TIME
	, cast(null as VARCHAR(78)) as "timestamp"
	, 'VALID'::varchar(7) as STATUS
	, case c.relpersistence when 't' then 'Y' else 'N' end as TEMPORARY
	, 'N'::VARCHAR(1) as GENERATED
	, 'N'::VARCHAR(1) as SECONDARY
	, c.reltablespace::integer as NAMESPACE
	, cast(null as VARCHAR(30)) as EDITION_NAME	
from pg_catalog.pg_class as c
inner join pg_catalog.pg_namespace as n on c.relnamespace = n.oid
where ((select usesuper from pg_catalog.pg_user where usename = user) or pg_has_role('rds_superuser', 'member'))
and n.nspname not in ('pg_catalog', 'information_schema', 'public_synonyms');

comment on view aws_oracle_ext.SYS_DBA_OBJECTS is
'DBA_OBJECTS describes all objects in the database. It has the same columns as SYS.ALL_OBJECTS.';
