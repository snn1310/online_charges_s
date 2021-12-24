CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessclob(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.CLOB' 
    AND ($1 ->> 'SYS.CLOB' <> '')
  THEN
     ($1->> 'SYS.CLOB')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;