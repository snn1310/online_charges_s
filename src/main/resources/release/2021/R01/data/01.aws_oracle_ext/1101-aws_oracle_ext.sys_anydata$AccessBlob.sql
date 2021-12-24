CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessblob(jsonb_value jsonb) 
 RETURNS BYTEA
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.BLOB')
   AND ($1 ->> 'SYS.BLOB' <> '') 
  THEN
	 ($1->> 'SYS.BLOB')::BYTEA
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;