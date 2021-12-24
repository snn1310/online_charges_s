create or replace view aws_oracle_ext.SYS_DBA_USERS as 
select 
	nspname as USERNAME
	, nspowner as USER_ID
	, cast (null as varchar(30)) as PASSWORD
	, cast('OPEN' as VARCHAR(32)) ACCOUNT_STATUS
	, cast(null as timestamp) as LOCK_DATE
	, cast(null as timestamp) as EXPIRY_DATE
	, 'USERS'::VARCHAR(30) as DEFAULT_TABLESPACE
	, 'TEMP'::VARCHAR(30) as TEMPORARY_TABLESPACE
	, cast(null as timestamp) as CREATED
	, 'DEFAULT'::VARCHAR(30) as PROFILE
	, cast(null as varchar(30))as INITIAL_RSRC_CONSUMER_GROUP
	, cast(null as varchar(4000)) as EXTERNAL_NAME
	, cast(null as varchar(8)) as PASSWORD_VERSIONS
	, cast(null as varchar(1)) as EDITIONS_ENABLED
	, 'PASSWORD'::VARCHAR(8) as AUTHENTICATION_TYPE
 from pg_catalog.pg_namespace
 where (select usesuper from pg_catalog.pg_user where usename = user) or pg_has_role('rds_superuser', 'member');

 comment on view aws_oracle_ext.SYS_DBA_USERS is
'describes all users of the database and contains more columns than ALL_USERS.';

