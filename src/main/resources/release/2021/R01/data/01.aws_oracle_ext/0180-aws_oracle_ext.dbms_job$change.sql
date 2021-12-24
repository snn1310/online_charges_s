/*
Subprogram to replace DBMS_JOB.change
*/

CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$change
  ( in job double precision
  , in what character varying
  , in next_date timestamp default now()
  , in "interval" character varying default 'null'
  , in instance double precision default null
  , in force boolean default false )
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs j
     set what = dbms_job$change.what
       , next_date = dbms_job$change.next_date
       , "interval" = dbms_job$change.interval
   where j.job = dbms_job$change.job;
END;
$BODY$ language plpgsql;
