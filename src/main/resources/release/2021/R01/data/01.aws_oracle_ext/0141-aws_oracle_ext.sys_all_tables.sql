create or replace view aws_oracle_ext.SYS_ALL_TABLES as
select 
	cast(t.schemaname as varchar(30)) as OWNER
	, cast(t.tablename as varchar(30)) as TABLE_NAME
	, cast(t.tablespace as varchar(30)) as TABLESPACE_NAME
	, cast(null as varchar(30)) as CLUSTER_NAME
	, cast(null as varchar(30)) as IOT_NAME
	, 'VALID'::VARCHAR(8) as STATUS	
	, cast(null as numeric) as PCT_FREE
	, cast(null as numeric) as PCT_USED	
	, cast(null as numeric) as INI_TRANS		
	, cast(null as numeric) as MAX_TRANS			
	, cast(null as numeric) as INITIAL_EXTENT			
	, cast(null as numeric) as NEXT_EXTENT			
	, cast(null as numeric) as MIN_EXTENTS
	, cast(null as numeric) as MAX_EXTENTS
	, cast(null as numeric) as PCT_INCREASE
	, cast(null as numeric) as FREELISTS
	, cast(null as numeric) as FREELIST_GROUPS
	, 'NO'::varchar(3) as LOGGING
	, 'N'::varchar(1) as BACKED_UP	
	, stat.n_live_tup as NUM_ROWS
	, cast(null as numeric) as BLOCKS
	, cast(null as numeric) as EMPTY_BLOCKS
	, cast(null as numeric) as AVG_SPACE
	, cast(null as numeric) as CHAIN_CNT
	, cast(null as numeric) as AVG_ROW_LEN
	, cast(null as numeric) as AVG_SPACE_FREELIST_BLOCKS
	, cast(null as numeric) as NUM_FREELIST_BLOCKS
	, cast(null as VARCHAR(10)) as DEGREE
	, cast(null as VARCHAR(10)) as INSTANCES	
	, cast(null as VARCHAR(5)) as CACHE
	, cast(null as VARCHAR(8)) as TABLE_LOCK
	, cast(null as numeric) as SAMPLE_SIZE
	, coalesce(stat.last_autoanalyze, stat.last_analyze)::date as LAST_ANALYZED 
	, 'NO'::VARCHAR(3) as PARTITIONED	
	, cast(null as VARCHAR(12)) as IOT_TYPE	
	, case when (n.nspname !~ '^pg_toast' and n.nspname like 'pg_temp%') then 'Y' else 'N' end as TEMPORARY
	, 'N'::VARCHAR(1) as SECONDARY
	, 'NO'::VARCHAR(3) as NESTED				
	, 'DEFAULT'::VARCHAR(7) as BUFFER_POOL					
	, 'DEFAULT'::VARCHAR(7) as FLASH_CACHE					
	, 'DEFAULT'::VARCHAR(7) as CELL_FLASH_CACHE					
	, 'DISABLED'::VARCHAR(8) as ROW_MOVEMENT
	, 'NO'::VARCHAR(3) as GLOBAL_STATS	
	, cast(null as VARCHAR(3)) as USER_STATS
	, cast(null as VARCHAR(15)) as DURATION	
	, 'DISABLED'::VARCHAR(8) as SKIP_CORRUPT
	, 'NO'::VARCHAR(3) as MONITORING	
	, cast(null as VARCHAR(30)) as CLUSTER_OWNER
	, 'DISABLED'::VARCHAR(8) as DEPENDENCIES
	, 'DISABLED'::VARCHAR(8) as COMPRESSION	
	, cast(null as VARCHAR(12)) as COMPRESS_FOR
	, 'NO'::VARCHAR(3) as DROPPED		
	, cast(null as VARCHAR(3)) as READ_ONLY	
	, 'YES'::VARCHAR(3) as SEGMENT_CREATED	
	, 'DEFAULT'::VARCHAR(7) as RESULT_CACHE										
from pg_catalog.pg_tables t
inner join pg_catalog.pg_stat_user_tables stat on  t.schemaname = stat.schemaname and t.tablename = stat.relname
inner join pg_catalog.pg_namespace as n on t.schemaname = n.nspname
where t.schemaname not in ('pg_catalog', 'information_schema', 'public_synonyms') and
(t.tableowner = user 
  or has_table_privilege(quote_ident(t.schemaname) ||'.'||quote_ident(t.tablename), 
						'SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER')
);

comment on view aws_oracle_ext.SYS_ALL_TABLES is
'The ALL_TABLES view describes all tables accessible to the current user.';
