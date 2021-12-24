CREATE OR REPLACE FUNCTION aws_oracle_ext.get_package_variable_v8
(
    IN sn TEXT,
    IN pn TEXT,
    IN vn TEXT
)
RETURNS TEXT
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
if (!aws_oracle_ext.hasOwnProperty(sn)) plv8.elog(ERROR, `unknown variable ${sn}.${pn}.${vn}.`);
if (!aws_oracle_ext[sn].hasOwnProperty(pn)) plv8.elog(ERROR, `unknown variable ${sn}.${pn}.${vn}.`);
if (!aws_oracle_ext[sn][pn].hasOwnProperty(vn)) plv8.elog(ERROR, `unknown variable ${sn}.${pn}.${vn}.`);

if (aws_oracle_ext[sn][pn][vn] instanceof Tree) plv8.elog(ERROR, `variable ${sn}.${pn}.${vn} has type Collection`);

return aws_oracle_ext[sn][pn][vn];

$BODY$
LANGUAGE plv8;