CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accessraw(jsonb_value jsonb)
 RETURNS BYTEA
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.RAW')
   AND ($1 ->> 'SYS.RAW' <> '') 
  THEN
	 ($1->> 'SYS.RAW')::BYTEA
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;