/*
Subprogram to replace DBMS_JOB.broken
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$broken
  ( in job double precision
  , in broken boolean
  , in next_date timestamp)
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs j
     set broken = case when dbms_job$broken.broken then 'Y' else 'N' end
   where j.job = dbms_job$broken.job;
END;
$BODY$ language plpgsql;
