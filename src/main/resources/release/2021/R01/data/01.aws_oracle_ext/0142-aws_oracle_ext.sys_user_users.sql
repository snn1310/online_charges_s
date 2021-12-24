create or replace view aws_oracle_ext.SYS_USER_USERS as
select  nspname as USERNAME
	, nspowner as USER_ID
	, cast('OPEN' as VARCHAR(32)) ACCOUNT_STATUS
	, cast(null as timestamp) as LOCK_DATE
	, cast(null as timestamp) as EXPIRY_DATE
	, 'USERS'::VARCHAR(30) as DEFAULT_TABLESPACE
	, 'TEMP'::VARCHAR(30) as TEMPORARY_TABLESPACE
	, cast(null as timestamp) as CREATED
	, cast(null as varchar(30))as INITIAL_RSRC_CONSUMER_GROUP
	, cast(null as varchar(4000)) as EXTERNAL_NAME
 from pg_catalog.pg_namespace n
inner join pg_catalog.pg_user u on n.nspowner = u.usesysid
where u.usename = user;

comment on view aws_oracle_ext.SYS_USER_USERS is
'USER_USERS describes the current user.';

