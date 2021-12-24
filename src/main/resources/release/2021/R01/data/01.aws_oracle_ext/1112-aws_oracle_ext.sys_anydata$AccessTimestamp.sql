CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accesstimestamp(jsonb_value jsonb)
 RETURNS TIMESTAMP WITHOUT TIME ZONE
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.TIMESTAMP' AND ($1 ->> 'SYS.TIMESTAMP' <> '') THEN
     ($1 ->> 'SYS.TIMESTAMP')::TIMESTAMP WITHOUT TIME ZONE    
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;