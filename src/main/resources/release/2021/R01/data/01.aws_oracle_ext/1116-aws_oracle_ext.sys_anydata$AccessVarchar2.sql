CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessvarchar2(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.VARCHAR2')
   AND ($1 ->> 'SYS.VARCHAR2' <> '') 
  THEN
	 ($1->> 'SYS.VARCHAR2')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;