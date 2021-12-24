create or replace view aws_oracle_ext.SYS_DBA_VIEWS as
select 
	cast(schemaname as varchar(30)) as OWNER
	, cast(viewname as varchar(30)) as VIEW_NAME
	, length(definition)::numeric as TEXT_LENGTH
	, cast(definition as varchar(409600)) as TEXT
	, cast(null as numeric) as TYPE_TEXT_LENGTH
	, cast(null as VARCHAR(4000)) as TYPE_TEXT
	, cast(null as numeric) as OID_TEXT_LENGTH	
	, cast(null as VARCHAR(4000)) as OID_TEXT	
	, cast(null as VARCHAR(30)) as VIEW_TYPE_OWNER		
	, cast(null as VARCHAR(30)) as VIEW_TYPE			
	, cast(null as VARCHAR(30)) as SUPERVIEW_NAME	
	, 'N'::VARCHAR(1) as EDITIONING_VIEW
	, 'Y'::VARCHAR(1) as READ_ONLY					
 from pg_catalog.pg_views 
where 
	((select usesuper from pg_catalog.pg_user where usename = user) or pg_has_role('rds_superuser', 'member')) 
	and	schemaname not in ('pg_catalog', 'information_schema', 'public_synonyms');	
comment on view aws_oracle_ext.SYS_DBA_VIEWS is
'The SYS.DBA_VIEWS view describes all views in the database.';
