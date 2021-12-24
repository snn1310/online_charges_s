CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessnchar(jsonb_value jsonb)
 RETURNS CHARACTER
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.NCHAR')
   AND ($1 ->> 'SYS.NCHAR' <> '') 
  THEN
	 ($1->> 'SYS.NCHAR')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;