CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_anydata$convertraw(value BYTEA) 
RETURNS jsonb
IMMUTABLE
PARALLEL SAFE
AS
$BODY$
    SELECT JSONB_BUILD_OBJECT('SYS.RAW', $1);     
$BODY$
LANGUAGE sql;