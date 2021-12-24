/*
Subprogram to replace DBMS_JOB.run
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$run
  ( in job double precision
  , in force boolean default false)
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs j
     set next_date = current_timestamp
       , broken = 'N'
   where j.job = dbms_job$run.job;
END;
$BODY$ language plpgsql;
