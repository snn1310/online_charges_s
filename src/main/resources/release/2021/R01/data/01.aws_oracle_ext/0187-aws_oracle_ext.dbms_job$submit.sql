/*
Subprogram to replace DBMS_JOB.submit
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$submit
  ( out job double precision
  , in what character varying
  , in next_date timestamp default now()
  , in "interval" character varying default 'null'
  , in no_parse boolean default false
  , in instance double precision default null
  , in force boolean default false )
  RETURNS double precision
AS
$BODY$
BEGIN
  insert into aws_oracle_ext.jobs( job, what, next_date, "interval" )
  values( default, what, next_date, "interval" )
  returning jobs.job::double precision into dbms_job$submit.job;
END;
$BODY$ language plpgsql;
