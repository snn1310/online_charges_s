CREATE OR REPLACE FUNCTION aws_oracle_ext.check_identifier_case
(
    IN pin TEXT
)
RETURNS TEXT AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const res = pin.substr(0,1) == '"' ? pin : pin.toLowerCase();
return res;

$BODY$
LANGUAGE plv8
IMMUTABLE
PARALLEL SAFE
RETURNS NULL ON NULL INPUT;
