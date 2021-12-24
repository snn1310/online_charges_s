CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessnvarchar2(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.NVARCHAR2')
   AND ($1 ->> 'SYS.NVARCHAR2' <> '') 
  THEN
	 ($1->> 'SYS.NVARCHAR2')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;