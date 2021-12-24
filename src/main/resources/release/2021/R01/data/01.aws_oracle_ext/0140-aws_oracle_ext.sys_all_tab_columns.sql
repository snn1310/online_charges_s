create or replace view aws_oracle_ext.SYS_ALL_TAB_COLUMNS as 
select 
	n.nspname::varchar(30) as OWNER
	, c.relname::varchar(30) as TABLE_NAME
	, a.attname::varchar(30) as COLUMN_NAME 
	, pg_catalog.format_type(a.atttypid, a.atttypmod)::varchar(106) as DATA_TYPE
	, cast(null as varchar(3)) as DATA_TYPE_MOD
	, cast(null as varchar(30)) as DATA_TYPE_OWNER
	, a.attlen::numeric as DATA_LENGTH 
	, cast(null as numeric) as DATA_PRECISION
	, cast(null as numeric) as DATA_SCALE	
	, case when a.attnotnull then 'N'::varchar(1) else 'Y'::varchar(1) end as NULLABLE
	, a.attnum::numeric as COLUMN_ID
	, cast(null as numeric) as DEFAULT_LENGTH
	, pg_get_expr(d.adbin, d.adrelid) as DATA_DEFAULT
	, s.n_distinct::numeric as NUM_DISTINCT
	, cast(null as numeric) as LOW_VALUE
	, cast(null as numeric) as HIGH_VALUE
	, s.null_frac::numeric as DENSITY
	, cast(null as numeric) as NUM_NULLS
	, cast(null as numeric) as NUM_BUCKETS
	, coalesce(st.last_autoanalyze, st.last_analyze)::date as LAST_ANALYZED 
	, cast(null as numeric) as SAMPLE_SIZE
	, 'NCHAR_CS'::varchar(44) as CHARACTER_SET_NAME
	, cast (null as numeric ) as CHAR_COL_DECL_LENGTH
	, case when coalesce(st.last_autoanalyze, st.last_analyze) is not null then 'YES'::varchar(3) else 'NO'::varchar(3) end as GLOBAL_STATS
	, 'NO'::varchar(3) as USER_STATS
	, s.avg_width::numeric as AVG_COL_LEN
	, information_schema._pg_char_max_length(information_schema._pg_truetypid(a, t), information_schema._pg_truetypmod(a, t)) as CHAR_LENGTH
	, cast(null as varchar(1)) as CHAR_USED
	, cast(null as varchar(3)) as V80_FMT_IMAGE
	, cast(null as varchar(3)) as DATA_UPGRADED
	, 'NONE'::varchar(4) as HISTOGRAM	
from pg_attribute a
inner join pg_class c on c.oid = a.attrelid 
inner join pg_catalog.pg_user u on c.relowner = u.usesysid
left join pg_attrdef d on c.oid = d.adrelid and a.attnum = d.adnum
inner join pg_namespace n on n.oid = c.relnamespace
inner join pg_type t on a.atttypid = t.oid
left join pg_stats s on (s.schemaname = n.nspname and s.tablename = c.relname and s.attname = a.attname)
left join pg_stat_user_tables st on st.relid = c.oid
where a.attnum > 0  and not a.attisdropped 
and c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char", 'p'::"char"])
and (u.usename = user  
 	or aws_oracle_ext.has_column_privilege(n.nspname, c.relname, a.attname)
  )
and n.nspname not in ('pg_catalog', 'information_schema', 'public_synonyms');

comment on view aws_oracle_ext.SYS_ALL_TAB_COLUMNS is
'ALL_TAB_COLUMNS describes the columns of the tables, views, and clusters accessible to the current user.';
