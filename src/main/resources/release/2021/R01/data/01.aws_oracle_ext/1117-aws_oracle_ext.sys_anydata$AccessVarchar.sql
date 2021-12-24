CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessvarchar(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.VARCHAR')
   AND ($1 ->> 'SYS.VARCHAR' <> '') 
  THEN
	 ($1->> 'SYS.VARCHAR')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;