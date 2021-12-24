create or replace view aws_oracle_ext.sys_dba_tab_comments
as
select
    n.nspname::character varying(30) as owner,
    c.relname::character varying(30) as table_name,
    case
       when c.relkind = 'r' then 'TABLE'
       when c.relkind = 'v' then 'VIEW'
    end table_type,
    obj_description(c.oid)::character varying(4000) as comments,
    0::numeric as origin_con_id
from
    pg_class c
    inner join pg_namespace n on c.relnamespace = n.oid            
where
      c.relkind in ('r', 'v', 'p')
  and not c.relispartition
  and ((select usesuper from pg_catalog.pg_user where usename = user) or pg_has_role('rds_superuser', 'member'))
  and n.nspname not in ('pg_catalog', 'information_schema', 'public_synonyms')