CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$user_export
  ( in job double precision
  , in out mycall character varying
  , in myinst character varying)
  RETURNS character varying
AS
$BODY$
BEGIN
  mycall := aws_oracle_ext.dbms_job$user_export( job := job );
END;
$BODY$ language plpgsql;