CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessbfile(jsonb_value jsonb)
 RETURNS CHARACTER VARYING
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.BFILE' THEN
     ($1->> 'SYS.BFILE')::CHARACTER VARYING
  ELSE
    NULL
  END;
$BODY$
LANGUAGE sql;