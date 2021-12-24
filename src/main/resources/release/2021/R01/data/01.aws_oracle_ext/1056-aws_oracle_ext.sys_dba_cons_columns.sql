create or replace view aws_oracle_ext.sys_dba_cons_columns as
select
x.cstrschema::character varying(128) as owner,  
x.cstrname::character varying(128) as constraint_name,  
x.tblname::character varying(128) as table_name,  
x.colname::character varying(4000) as column_name,   
rank() over (partition by x.cstrschema,x.tblname,x.cstrname order by x.colnum)::smallint as position
FROM ( SELECT DISTINCT nr.nspname,
        r.relname,
        r.relowner,
        a.attname,
        a.attnum,
        nc.nspname,
        c.conname
       FROM pg_namespace nr,
        pg_class r,
        pg_attribute a,
        pg_depend d,
        pg_namespace nc,
        pg_constraint c
      WHERE nr.oid = r.relnamespace
      AND r.oid = a.attrelid
      AND d.refclassid = 'pg_class'::regclass::oid
      AND d.refobjid = r.oid
      AND d.refobjsubid = a.attnum
      AND d.classid = 'pg_constraint'::regclass::oid
      AND d.objid = c.oid
      AND c.connamespace = nc.oid
      AND c.contype = 'c'::"char"
      AND (r.relkind = ANY (ARRAY['r'::"char", 'p'::"char"]))
      AND NOT a.attisdropped
    UNION ALL
      SELECT nr.nspname,
        r.relname,
        r.relowner,
        a.attname,
        a.attnum,
        nc.nspname,
        c.conname
       FROM pg_namespace nr,
        pg_class r,
        pg_attribute a,
        pg_namespace nc,
        pg_constraint c
      WHERE nr.oid = r.relnamespace
      AND r.oid = a.attrelid
      AND nc.oid = c.connamespace
      AND r.oid =   CASE c.contype
		                WHEN 'f'::"char" THEN c.confrelid
		                ELSE c.conrelid
		            END AND (a.attnum = ANY (
		            CASE c.contype
		                WHEN 'f'::"char" THEN c.confkey
		                ELSE c.conkey
		            END))
       AND NOT a.attisdropped
       AND (c.contype = ANY (ARRAY['p'::"char", 'u'::"char", 'f'::"char"]))
       AND (r.relkind = ANY (ARRAY['r'::"char", 'p'::"char"]))
	) x(tblschema, tblname, tblowner, colname, colnum, cstrschema, cstrname)
where ( select pg_user.usesuper from pg_user where pg_user.usename = user) or pg_has_role('rds_superuser', 'member');

COMMENT ON VIEW aws_oracle_ext.sys_dba_cons_columns IS 'DBA_CONS_COLUMNS describes all columns in the database that are specified in constraints.';
