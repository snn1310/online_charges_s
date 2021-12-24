CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessurowid(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.UROWID') AND ($1 ->> 'SYS.UROWID' <> '') 
  THEN
	 ($1->> 'SYS.UROWID')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;