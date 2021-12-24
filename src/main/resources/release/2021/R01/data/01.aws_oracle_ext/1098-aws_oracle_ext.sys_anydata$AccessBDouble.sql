CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessbdouble(jsonb_value jsonb)
 RETURNS DOUBLE PRECISION
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.BINARY_DOUBLE')
   AND ($1 ->> 'SYS.BINARY_DOUBLE' <> '') 
  THEN
	 ($1->> 'SYS.BINARY_DOUBLE')::DOUBLE PRECISION
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;