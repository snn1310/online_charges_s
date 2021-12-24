CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_get
(
    IN p_routine_name TEXT,
    IN p_collection_path TEXT
)
RETURNS JSONB
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

if (pathlength < 2) {
  plv8.elog(ERROR, 'Incorrect collection path');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}
if (pathParts[1].group !== 'idx') {
  plv8.elog(ERROR, 'Incorrect collection path');
}

const vn = pathParts[0].text;
chk(sn, pn, vn);
const indexBy = aws_oracle_ext[sn][pn][vn].indexBy;
const aidx = [...pathParts[1].text];
aidx.shift();
aidx.pop();
if (indexBy === 'STRING') {
  aidx.shift();
  aidx.pop();
}
const stridx = aidx.join('');
const idx = indexBy === 'BIGINT' ? Number(stridx) : stridx;
if (indexBy === 'BIGINT' && isNaN(idx)) {
  plv8.elog(ERROR, 'Incorrect value for index');
}
const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;
let result = aws_oracle_ext[sn][pn][vn].getValue(idx);
if (typeof(result) === 'undefined') {
  if (collectionType !== 'ASSOC' /*&& result !== emptyCollectionElement*/) {
    plv8.elog(ERROR, 'ORA-06533: Subscript beyond count');
  } else {
    return null;
  }
}
if (collectionType !== 'ASSOC' && result === emptyCollectionElement) return null;
if (result instanceof Date) {
  return {column_value: result};
}
if (result === null) {
  return {column_value: result};
}
if (typeof(result) !=='object' ) {
  return {column_value: result};
}
return result;

$BODY$
LANGUAGE plv8;