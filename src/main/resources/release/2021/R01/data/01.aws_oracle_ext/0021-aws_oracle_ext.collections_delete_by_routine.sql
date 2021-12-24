CREATE OR REPLACE FUNCTION aws_oracle_ext.collections_delete_by_routine
(
    IN p_routine_name TEXT
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
const pathParts = parser(p_routine_name);
if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');

const sn = pathParts[0].text;
const pn = pathParts[2].text;

if (typeof(aws_oracle_ext) === 'undefined') plv8.elog(ERROR, 'Collection does not exist!');
if (typeof(aws_oracle_ext[sn]) === 'undefined') plv8.elog(ERROR, 'Collection does not exist!');
if (typeof(aws_oracle_ext[sn][pn]) === 'undefined') plv8.elog(ERROR, 'Collection does not exist!');

for (const key in aws_oracle_ext[sn][pn]) {
  if (aws_oracle_ext[sn][pn][key] instanceof Tree) delete aws_oracle_ext[sn][pn][key];
}

$BODY$
LANGUAGE plv8;