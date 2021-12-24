CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessnclob(jsonb_value jsonb)
 RETURNS TEXT
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.NCLOB')
   AND ($1 ->> 'SYS.NCLOB' <> '') 
  THEN
	 ($1->> 'SYS.NCLOB')
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;