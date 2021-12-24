CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessnumber(jsonb_value jsonb)
 RETURNS NUMERIC
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.NUMBER')
   AND ($1 ->> 'SYS.NUMBER' <> '') 
  THEN
	 ($1->> 'SYS.NUMBER')::NUMERIC
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;