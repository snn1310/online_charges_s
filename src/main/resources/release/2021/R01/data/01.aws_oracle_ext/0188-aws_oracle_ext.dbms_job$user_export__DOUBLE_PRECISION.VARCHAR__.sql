CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_job$user_export
  ( in job double precision
  , in out mycall character varying)
  RETURNS character varying
AS
$BODY$
BEGIN
  select 'PERFORM aws_oracle_ext.dbms_job$isubmit( ' || j.job || ', ''' || replace( j.what, '''', '''''' ) || ''', to_timestamp( ''' || to_char( j.next_date, 'YYYYMMDDHH24MISS' ) || ''', ''YYYYMMDDHH24MISS'') , ''' || j.interval || ''' );'
    into mycall
    from aws_oracle_ext.jobs as j
   where j.job = job;
END;
$BODY$ language plpgsql;
