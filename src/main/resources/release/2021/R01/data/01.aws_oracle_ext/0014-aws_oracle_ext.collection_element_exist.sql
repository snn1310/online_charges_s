CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_exists
(
    IN p_routine_name TEXT,
    IN p_collection_path TEXT,
    IN p_idx TEXT
)
RETURNS BOOLEAN
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

const chk = plv8.find_function("aws_oracle_ext.collectioncheck");

pathParts = parser(p_collection_path);
const pathlength = pathParts.length;

if (pathlength != 1) {
  plv8.elog(ERROR, 'Nested collection is not supported');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}

const vn = pathParts[0].text;
chk(sn, pn, vn);
const indexBy = aws_oracle_ext[sn][pn][vn].indexBy;

const idx = indexBy === 'BIGINT' ? Number(p_idx) : p_idx;

if (indexBy === 'BIGINT' && isNaN(idx)) {
  plv8.elog(ERROR, 'Incorrect value for index');
}

const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;

const tst = aws_oracle_ext[sn][pn][vn].getValue(idx);

let result = false;
  if (typeof(tst) !== 'undefined') {
    if (collectionType === 'ASSOC') {
      result = true;
    } else {
      result = (tst !== emptyCollectionElement);
    }
  }

return result;

$BODY$
LANGUAGE plv8;