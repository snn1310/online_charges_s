create or replace function aws_oracle_ext.sys_anydata$gettypename(jsonb_value jsonb)
 RETURNS character varying
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
  SELECT
  case
      WHEN jsonb_value ? 'SYS.NUMBER' then 'SYS.NUMBER'
      WHEN jsonb_value ? 'SYS.DATE' then 'SYS.DATE'
      WHEN jsonb_value ? 'SYS.CHAR' then 'SYS.CHAR'
      WHEN jsonb_value ? 'SYS.VARCHAR' then 'SYS.VARCHAR'
      WHEN jsonb_value ? 'SYS.VARCHAR2' then 'SYS.VARCHAR2'
      WHEN jsonb_value ? 'SYS.RAW' then 'SYS.RAW'
      WHEN jsonb_value ? 'SYS.CLOB' then 'SYS.CLOB'
      WHEN jsonb_value ? 'SYS.BLOB' then 'SYS.BLOB'
      WHEN jsonb_value ? 'SYS.BFILE' then 'SYS.BFILE'
      WHEN jsonb_value ? 'SYS.TIMESTAMP' then 'SYS.TIMESTAMP'
      WHEN jsonb_value ? 'SYS.TIMESTAMP_WITH_TIMEZONE' then 'SYS.TIMESTAMP_WITH_TIMEZONE'
      WHEN jsonb_value ? 'SYS.TIMESTAMP_WITH_LTZ' then 'SYS.TIMESTAMP_WITH_LTZ'
      WHEN jsonb_value ? 'SYS.INTERVAL_YEAR_MONTH' then 'SYS.INTERVAL_YEAR_MONTH'
      WHEN jsonb_value ? 'SYS.INTERVAL_DAY_SECOND' then 'SYS.INTERVAL_DAY_SECOND'
      WHEN jsonb_value ? 'SYS.NCHAR' then 'SYS.NCHAR'
      WHEN jsonb_value ? 'SYS.NVARCHAR2' then 'SYS.NVARCHAR2'
      WHEN jsonb_value ? 'SYS.NCLOB' then 'SYS.NCLOB'
      WHEN jsonb_value ? 'SYS.BINARY_FLOAT' then 'SYS.BINARY_FLOAT'
      WHEN jsonb_value ? 'SYS.BINARY_DOUBLE' then 'SYS.BINARY_DOUBLE'
      WHEN jsonb_value ? 'SYS.UROWID' then 'SYS.UROWID'
      ELSE NULL
  end;
$BODY$
LANGUAGE sql;