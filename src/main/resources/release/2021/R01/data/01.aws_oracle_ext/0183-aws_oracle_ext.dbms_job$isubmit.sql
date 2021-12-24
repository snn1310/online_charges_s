/*
Subprogram to replace DBMS_JOB.isubmit
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$isubmit
  ( in job double precision
  , in what character varying
  , in next_date timestamp default now()
  , in "interval" character varying default 'null'
  , in no_parse boolean default false
  , in instance double precision default null
  , in force boolean default false )
  RETURNS void
AS
$BODY$
BEGIN
  insert into aws_oracle_ext.jobs( job, what, next_date, "interval" )
  values( job, what, next_date, "interval" );
END;
$BODY$ language plpgsql;
