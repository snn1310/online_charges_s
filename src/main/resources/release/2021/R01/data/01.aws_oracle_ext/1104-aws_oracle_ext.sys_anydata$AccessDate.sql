CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessdate(jsonb_value jsonb)
 RETURNS TIMESTAMP WITHOUT TIME ZONE
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.DATE' AND ($1 ->> 'SYS.DATE' <> '') 
  THEN
     ($1 ->> 'SYS.DATE')::TIMESTAMP(0) WITHOUT TIME ZONE    
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;