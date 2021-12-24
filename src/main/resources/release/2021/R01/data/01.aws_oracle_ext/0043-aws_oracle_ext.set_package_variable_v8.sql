CREATE OR REPLACE FUNCTION aws_oracle_ext.set_package_variable_v8
(
    IN sn TEXT,
    IN pn TEXT,
    IN vn TEXT,
    IN vv TEXT
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
if (typeof(aws_oracle_ext) === 'undefined')aws_oracle_ext = {};
if (!aws_oracle_ext.hasOwnProperty(sn)) aws_oracle_ext[sn] = {};
if (!aws_oracle_ext[sn].hasOwnProperty(pn)) aws_oracle_ext[sn][pn] = {};

if (!(aws_oracle_ext[sn][pn][vn] instanceof Tree)) aws_oracle_ext[sn][pn][vn] = vv;

$BODY$
LANGUAGE plv8;