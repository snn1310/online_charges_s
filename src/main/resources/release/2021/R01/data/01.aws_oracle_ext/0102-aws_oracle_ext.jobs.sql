CREATE TABLE aws_oracle_ext.jobs
(
  job BIGINT NOT NULL DEFAULT nextval('aws_oracle_ext.jobs_job_seq'),
  name character varying(256),
  description character varying(2000),
  log_user character varying(128) default session_user,
  priv_user character varying(128) default current_user,
  schema_user character varying(128) default current_schema,
  search_path character varying default array_to_string(current_schemas(true), ','),
  what character varying not null,
  last_date timestamp with time zone,
  this_date timestamp with time zone,
  next_date timestamp with time zone not null,
  interval character varying not null,
  total_time numeric default 0,
  broken character varying(1) default 'N',
  failures integer default 0,
  last_failure_message text default null
);

