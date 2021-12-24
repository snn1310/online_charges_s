create or replace view aws_oracle_ext.sys_dba_source as
select
  n.nspowner::character varying(30) as owner
  , name::character varying(30)
  , type::character varying(12)
  , generate_subscripts(text, 1)::numeric as line
  , unnest(text)::character varying(4000) as text  
from (
    select 
      c.relnamespace as nsp,
      t.tgname as name,
      'TRIGGER' as type,
      string_to_array(pg_get_triggerdef(t.oid),chr(10))  as text
    from pg_catalog.pg_trigger t
    inner join pg_catalog.pg_class c on c.oid = t.tgrelid
    inner join pg_user u on  u.usesysid = c.relowner
    
    union all
    
    select 
      pronamespace as nsp,
      f.proname AS name,
      case 
        when f.prokind = 'f' then 
          'FUNCTION'
        when f.prokind = 'p' then
          'PROCEDURE'
       end as type,           
       string_to_array(pg_get_functiondef(f.oid), chr(10)) AS text           
    from pg_proc f 
    inner join pg_type as ret on f.prorettype = ret.oid
    inner join pg_user u on u.usesysid = f.proowner
    where f.prokind in ('f', 'p')

    union all
    
    select 
       t.typnamespace as nsp,
       t.typname as name,
       'TYPE' as type,
       case
         when t.typtype = 'c' then
          array (
            select 'CREATE OR REPLACE TYPE ' || t.typname || ' AS (' || chr(10) 
          	  union all
          	select 
          	  a.attname::text || ' ' || 
          	  format_type(a.atttypid, a.atttypmod) ||  
          	  case 
          	    when (lead(a.attrelid, 1) over()) is null then 
          	      '' 
          	    else 
          	      ','  
          	  end
          	  || chr(10)
            from pg_attribute a
            where attrelid = t.typrelid
              union all
            select ');'
            )
         when t.typtype = 'd' then
          array (
            select 'CREATE OR REPLACE DOMAIN ' || t.typname || ' AS ' || format_type(tt.oid, NULL) 
            from pg_type tt
            where tt.typarray = t.typbasetype
           ) 
         else
          null
       end as text
  from pg_catalog.pg_type t
  inner join pg_user u on u.usesysid = t.typowner
  where (
    t.typrelid = 0 
      or (
         select c.relkind = 'c'
         from pg_catalog.pg_class c
         where c.oid = t.typrelid
         )
        )
   and not exists (
         select 1
         from pg_catalog.pg_type el
         where el.oid = t.typelem
           and el.typarray = t.oid
         )
  ) s
 inner join pg_namespace n on  s.nsp = n.oid  
 
where n.nspname <> 'pg_catalog'
   and n.nspname <> 'information_schema'
   and n.nspname !~ '^pg_toast'