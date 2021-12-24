create or replace view aws_oracle_ext.sys_user_col_comments
as
select
    c.relname as table_name,
    a.attname as column_name,
    pg_catalog.col_description(a.attrelid, a.attnum) as comments,
    a.attnum as origin_con_id
from
    pg_class c
        inner join pg_namespace n on c.relnamespace = n.oid
        inner join pg_user u on c.relowner = u.usesysid
        inner join pg_catalog.pg_attribute a on c.oid = a.attrelid
                                            and a.attnum > 0
where
      c.relkind in ('r', 'v', 'p')
  and not c.relispartition
  and n.nspname not in ('pg_catalog', 'information_schema', 'public_synonyms')
  and u.usename = user;