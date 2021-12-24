CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_bind_out
(
    p_routine_name IN VARCHAR,
    p_collection_path IN VARCHAR
 )
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
let pathParts = parser(p_routine_name);

if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');
const sn = pathParts[0].text;
const pn = pathParts[2].text;

pathParts = parser(p_collection_path);
const pathlength = pathParts.length;

if (pathlength != 1) {
  plv8.elog(ERROR, 'Nested collection is not supported');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}

const vn = pathParts[0].text;

let create = false;

if (typeof(aws_oracle_ext) === 'undefined') create = true;
if (!create) {
  if (!aws_oracle_ext.hasOwnProperty(sn)) create = true;
}
if (!create) {
  if (!aws_oracle_ext[sn].hasOwnProperty(pn)) create = true;
}
if (!create) {
  if (!aws_oracle_ext[sn][pn].hasOwnProperty(vn)) create = true;
}

if (create) {
  const doCreate = plv8.find_function("aws_oracle_ext.array$create_array");
  doCreate(vn, p_routine_name, null, 'BIGINT');

}

$BODY$
LANGUAGE plv8;