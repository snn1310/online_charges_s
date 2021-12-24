/*
Subprogram to replace DBMS_JOB.instance
*/

CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$instance
  ( in job double precision
  , in instance double precision
  , in force boolean)
  RETURNS void
AS
$BODY$
BEGIN
  null;
END;
$BODY$ language plpgsql;
