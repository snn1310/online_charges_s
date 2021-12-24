create or replace view aws_oracle_ext.sys_user_ind_columns as
select
  irel.relname::character varying(128) as index_name,
  trel.relname::character varying(128) as table_name,
  a.attname::character varying(4000)   as column_name,
  c.ORDINALITY::int as column_position,
  coalesce(information_schema._pg_char_max_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)),
           information_schema._pg_numeric_precision(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*))
           )::int as column_length,
  coalesce(information_schema._pg_char_max_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)),
           0)::int as char_length,
  case o.option & 1 when 1 then 'DESC' else 'ASC' END::character varying(4) as descend,
  null::int as collated_column_id
from pg_index as i
join pg_class as trel on trel.oid = i.indrelid
join pg_namespace as tnsp on trel.relnamespace = tnsp.oid
join pg_class as irel on irel.oid = i.indexrelid
join pg_namespace as insp on irel.relnamespace = insp.oid
cross join lateral unnest (i.indkey) with ordinality as c (colnum, ordinality)
left join lateral unnest (i.indoption) with ordinality as o (option, ordinality)
  on c.ordinality = o.ordinality
join pg_attribute as a on trel.oid = a.attrelid and a.attnum = c.colnum
join (pg_type t join pg_namespace nt on t.typnamespace = nt.oid) on a.atttypid = t.oid
join pg_user ui on irel.relowner = ui.usesysid 
join pg_user ut on trel.relowner = ut.usesysid
where ui.usename = user or ut.usename = user;

COMMENT ON VIEW aws_oracle_ext.sys_user_ind_columns IS 'USER_IND_COLUMNS describes the columns of the indexes owned by the current user and columns of indexes on tables owned by the current user.';
