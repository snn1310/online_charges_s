CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_bind
(
    p_routine_name IN VARCHAR,
    p_collection_path IN VARCHAR,
    p_dataset IN JSON
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
const doCreate = plv8.find_function("aws_oracle_ext.array$create_array");
doCreate(vn, p_routine_name, null, 'BIGINT');

for (let i = 0; i < p_dataset.length; i++) {
  const idx = Number(p_dataset[i].k);
  aws_oracle_ext[sn][pn][vn].putValue(idx, p_dataset[i].v);
}

$BODY$
LANGUAGE plv8;