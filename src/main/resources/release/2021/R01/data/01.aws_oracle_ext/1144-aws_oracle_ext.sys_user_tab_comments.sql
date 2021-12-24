create or replace view aws_oracle_ext.sys_user_tab_comments
as
select
    c.relname::character varying(30) as table_name,
    case
       when c.relkind = 'r' then 'TABLE'
       when c.relkind = 'v' then 'VIEW'
    end table_type,
    obj_description(c.oid)::character varying(4000) as comments
from
    pg_class c
    inner join pg_namespace n
        on c.relnamespace = n.oid 
    inner join pg_user u on u.usesysid = c.relowner
               
where
      c.relkind in ('r', 'v', 'p')
  and not c.relispartition
  and n.nspname not in ('pg_catalog', 'information_schema', 'public_synonyms')
  and u.usename = user;