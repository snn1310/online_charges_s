CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$accesschar(jsonb_value jsonb) RETURNS CHARACTER
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
SELECT
  CASE WHEN (aws_oracle_ext.sys_anydata$gettypename($1) = 'SYS.CHAR')
   AND ($1 ->> 'SYS.CHAR' <> '') 
  THEN
	 ($1->> 'SYS.CHAR')::CHARACTER
  ELSE
     NULL
  END;
$BODY$
LANGUAGE sql;