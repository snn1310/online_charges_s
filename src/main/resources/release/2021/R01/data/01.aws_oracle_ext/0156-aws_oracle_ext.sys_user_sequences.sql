create or replace view aws_oracle_ext.SYS_USER_SEQUENCES as 
SELECT 
	s.sequence_name::varchar(30) as SEQUENCE_NAME
	, s.minimum_value::numeric as MIN_VALUE 
	, s.maximum_value::numeric as MAX_VALUE
	, s.increment::numeric as INCREMENT_BY
	, case s.cycle_option
		when 'NO' then 'N'::VARCHAR(1) 
		when 'YES' then 'Y'::VARCHAR(1) 
	end as CYCLE_FLAG
	, 'N'::VARCHAR(1) as  ORDER_FLAG
	, 0 as CACHE_SIZE
	, currval(quote_ident(s.sequence_schema) || '.' || quote_ident(s.sequence_name)) as LAST_NUMBER
FROM information_schema.sequences s
inner join pg_catalog.pg_class c on c.relname = s.sequence_name and c.relkind = 'S'
inner join pg_catalog.pg_user u on c.relowner = u.usesysid
where u.usename = user;

comment on view aws_oracle_ext.SYS_USER_SEQUENCES is
'USER_SEQUENCES describes all sequences owned by the current user';

