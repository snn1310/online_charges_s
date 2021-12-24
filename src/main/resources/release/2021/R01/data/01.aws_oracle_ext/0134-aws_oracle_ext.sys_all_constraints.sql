create or replace view aws_oracle_ext.SYS_ALL_CONSTRAINTS as
select 
	n.nspname::varchar(30) as OWNER
	, c.conname::varchar(30) as CONSTRAINT_NAME
	, c.contype::varchar(1) as CONSTRAINT_TYPE
	, cl.relname::varchar(30) as TABLE_NAME
	, pg_get_constraintdef(c.oid) SEARCH_CONDITION
	, n_ref.nspname::varchar(30) as R_OWNER
	, c_ref.conname::varchar(30) as R_CONSTRAINT_NAME 
	, case c.confdeltype 
		when 'a' then 'no action'::varchar(9) 
		when 'r' then 'restrict'::varchar(9)
		when 'c' then 'cascade'::varchar(9)
		when 'n' then 'set null'::varchar(9)
		when 'd' then 'set default'::varchar(11)
		else cast(null as VARCHAR(9))
	end as DELETE_RULE
	, 'ENABLED'::varchar(8) as STATUS 
	, case when c.condeferrable then 'DEFERRABLE'::varchar(14) else 'NOT DEFERRABLE'::varchar(14) end as DEFERRABLE
	, case when c.condeferred then 'DEFERRED'::varchar(9) else  'IMMEDIATE'::varchar(9) end as DEFERRED
	, case when c.convalidated then 'VALIDATED'::varchar(13) else 'NOT VALIDATED'::varchar(13) end as VALIDATED
	, 'GENERATED NAME'::varchar(14) as GENERATED
	, cast(null as varchar(3)) as BAD
	, cast(null as varchar(4)) as RELY
	, cast(null as date) as LAST_CHANGE
	, n.nspname::varchar(30) as INDEX_OWNER
	, cl_ind.relname::varchar(30) as INDEX_NAME
	, cast(null as varchar(7)) as INVALID
	, cast(null as varchar(14)) as VIEW_RELATED
from pg_constraint c
inner join pg_namespace n on n.oid = c.connamespace
inner join pg_class cl on cl.oid = c.conrelid
inner join pg_catalog.pg_user u on cl.relowner = u.usesysid
left join pg_class cl_ref on cl_ref.oid = c.confrelid
left join pg_namespace n_ref on n_ref.oid = cl_ref.relnamespace	
left join pg_constraint c_ref on c_ref.conrelid = c.confrelid and c_ref.contype = 'p'
left join pg_index i on i.indrelid = cl_ref.oid
left join pg_class cl_ind on cl_ind.oid = c.conindid
where u.usename = user 
or has_table_privilege(quote_ident(n_ref.nspname) ||'.'||quote_ident(cl.relname), 
					   'SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER');

comment on view aws_oracle_ext.SYS_ALL_CONSTRAINTS is
'ALL_CONSTRAINTS describes constraint definitions on tables accessible to the current user.';

