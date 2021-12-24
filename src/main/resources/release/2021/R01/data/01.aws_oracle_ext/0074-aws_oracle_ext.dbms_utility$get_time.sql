CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_utility$get_time()
RETURNS BIGINT
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
  return Date.now() / 10;

$BODY$
LANGUAGE plv8;