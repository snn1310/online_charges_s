create or replace view aws_oracle_ext.SYS_DBA_SEQUENCES as 
SELECT 
	s.schemaname::varchar(30) as SEQUENCE_OWNER
	, s.sequencename::varchar(30) as SEQUENCE_NAME
	, s.min_value::numeric as MIN_VALUE 
	, s.max_value::numeric as MAX_VALUE
	, s.increment_by::numeric as INCREMENT_BY
	, case s.cycle
		when 'NO' then 'N'::VARCHAR(1) 
		when 'YES' then 'Y'::VARCHAR(1) 
	end as CYCLE_FLAG
	, 'N'::VARCHAR(1) as  ORDER_FLAG
	, s.cache_size as CACHE_SIZE
	, s.last_value as LAST_NUMBER
FROM pg_sequences s
inner join pg_catalog.pg_class c on c.relname = s.sequencename and c.relkind = 'S'
inner join pg_catalog.pg_user u on c.relowner = u.usesysid 
where (select usesuper from pg_catalog.pg_user where usename = user) or pg_has_role('rds_superuser', 'member');

comment on view aws_oracle_ext.SYS_DBA_SEQUENCES is
'DBA_SEQUENCES describes all sequences in the database';

