CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessbfloat(jsonb_value jsonb)
 RETURNS REAL
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.BINARY_FLOAT')
   AND ($1 ->> 'SYS.BINARY_FLOAT' <> '') 
  THEN
	 ($1->> 'SYS.BINARY_FLOAT')::REAL
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;