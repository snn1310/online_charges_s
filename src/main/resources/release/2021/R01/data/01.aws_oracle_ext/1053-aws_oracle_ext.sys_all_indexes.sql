create or replace view aws_oracle_ext.sys_all_indexes as
select
tnsp.nspname::character varying(128) as owner,  
irel.relname::character varying(128) as index_name,  
case
	when (i.indexprs is null) then 'NORMAL'
	else 'FUNCTION-BASED NORMAL'
end::character varying(27) as index_type,   
tnsp.nspname::character varying(128) as table_owner,  
trel.relname::character varying(128) as table_name,  
'TABLE'::character varying(11) as table_type,   
case 
	when i.indisunique then 'UNIQUE'
	else 'NONUNIQUE'
end::character varying(9) as uniqueness,    
'DISABLED'::character varying(13) as compression,   
null::integer as prefix_length,              
ts.spcname::character varying(30) as tablespace_name,   
null::integer as ini_trans,              
null::integer as max_trans,              
null::integer as initial_extent,              
null::integer as next_extent,              
null::integer as min_extents,              
null::integer as max_extents,              
null::integer as pct_increase,              
null::integer as pct_threshold,              
null::integer as include_column,              
null::integer as freelists,              
null::integer as freelist_groups,              
null::integer as pct_free,              
case trel.relpersistence
	when 'p' then 'YES'
	else 'NO'
end::character varying(3) as logging,    
null::integer as blevel,              
null::integer as leaf_blocks,              
case
	when i.indisprimary then st.n_live_tup
	else null
end::integer as distinct_keys,              
null::integer as avg_leaf_blocks_per_key,              
null::integer as avg_data_blocks_per_key,              
null::integer as clustering_factor,              
case 
	when i.indisready then 'ENABLED'
	else 'DISABLED'
end::character varying(8) as status,    
st.n_live_tup::integer as num_rows,              
null::integer as sample_size,              
coalesce(st.last_autoanalyze, st.last_analyze)::date as last_analyzed,                
null::character varying(40) as degree,   
null::character varying(40) as instances,   
case
	when trel.relispartition then 'YES'
	else 'NO'
end::character varying(3) as partitioned,    
case trel.relpersistence
	when 't' then 'Y'
	else 'N'
end::character varying(1) as temporary,    
'N'::character varying(1) as generated,    
'N'::character varying(1) as secondary,    
'DEFAULT'::character varying(7) as buffer_pool,    
'DEFAULT'::character varying(7) as flash_cache,    
'DEFAULT'::character varying(7) as cell_flash_cache,    
'NO'::character varying(3) as user_stats,    
null::character varying(15) as duration,   
null::integer as pct_direct_access,              
null::character varying(128) as ityp_owner,  
null::character varying(128) as ityp_name,  
null::character varying(1000) as parameters, 
'NO'::character varying(3) as global_stats,    
null::character varying(12) as domidx_status,   
null::character varying(6) as domidx_opstatus,    
null::character varying(8) as funcidx_status,    
'NO'::character varying(3) as join_index,    
'NO'::character varying(3) as iot_redundant_pkey_elim,    
'NO'::character varying(3) as dropped,    
case 
	when i.indisvalid then 'VISIBLE'
	else 'INVISIBLE'
end::character varying(9) as visibility,
null::character varying(14) as domidx_management,   
case irel.relpages
	when 0 then 'NO'
	else 'YES'
end::character varying(3) as segment_created,    
'NO'::character varying(3) as orphaned_entries,    
case
	when (i.indpred is null) then 'FULL'
	else 'PARTIAL'
end::character varying(7) as indexing
from pg_index as i
join pg_class as trel on trel.oid = i.indrelid
join pg_namespace as tnsp on trel.relnamespace = tnsp.oid
join pg_class as irel on irel.oid = i.indexrelid
join pg_am am on am.oid = irel.relam and am.amname = 'btree'
left join pg_tablespace ts on ts.oid = irel.reltablespace
left join pg_stat_all_tables st on st.schemaname  = tnsp.nspname and st.relname = trel.relname
where (pg_has_role(trel.relowner, 'USAGE'::text)
	or has_table_privilege(trel.oid, 'SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text));

COMMENT ON VIEW aws_oracle_ext.sys_all_indexes IS 'ALL_INDEXES describes the indexes on the tables accessible to the current user.';
