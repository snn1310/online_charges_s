/*
Subprogram to replace DBMS_JOB.what
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$what
  ( in job double precision
  , in what character varying)
  RETURNS void
AS
$BODY$
BEGIN
  update aws_oracle_ext.jobs j
     set j.what = what
   where j.job = job;
END;
$BODY$ language plpgsql;
