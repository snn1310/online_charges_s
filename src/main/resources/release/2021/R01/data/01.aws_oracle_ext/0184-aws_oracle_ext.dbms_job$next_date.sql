/*
Subprogram to replace DBMS_JOB.next_date
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$next_date
  ( in job double precision
  , in next_date timestamp)
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs j
     set j.next_date = next_date
   where j.job = dbms_job$next_date.job;
END;
$BODY$ language plpgsql;
