/*
Subprogram to replace DBMS_JOB.remove
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$remove
  ( in job double precision )
  RETURNS void
AS
$BODY$
BEGIN
  delete from aws_oracle_ext.jobs j where j.job = dbms_job$remove.job;
END;
$BODY$ language plpgsql;
