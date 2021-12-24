/*
Subprogram to replace DBMS_JOB.interval
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$interval
  ( in job double precision
  , in "interval" character varying)
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs
     set "interval" = dbms_job$interval."interval"
   where jobs.job = dbms_job$interval.job;
END;
$BODY$ language plpgsql;
