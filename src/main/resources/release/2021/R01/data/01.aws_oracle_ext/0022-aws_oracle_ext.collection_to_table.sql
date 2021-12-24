CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_to_table
(
    IN p_val JSONB,
    IN pindexes BIGINT[] DEFAULT NULL
)
RETURNS SETOF JSONB
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
const routine_name = p_val['Procedure Name'];
const collection_path = p_val['Array Name'];
let pathParts = parser(routine_name);

if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');

const sn = pathParts[0].text;
const pn = pathParts[2].text;

const chk = plv8.find_function("aws_oracle_ext.collectioncheck");

pathParts = parser(collection_path);
const pathlength = pathParts.length;

if (pathlength != 1) {
  plv8.elog(ERROR, 'Nested collection is not supported');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}

const vn = pathParts[0].text;
chk(sn, pn, vn);
const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;

let resType = -1;
if (pindexes == null) {
  aws_oracle_ext[sn][pn][vn].walkAsc(null, null, function(key, value) {
    if (collectionType === 'ASSOC' || (collectionType !=='ASSOC' && value !== emptyCollectionElement)) {
      if (resType === -1) {
        resType = typeof(value) === 'object' ? 1 : 0;
      }
      if (resType === 0) {
        plv8.return_next({"column_value": value});
      } else {
        plv8.return_next(value);
      }
    }
  });
} else {

  for (let i = 0; i < pindexes.length; i++) {
    const value = aws_oracle_ext[sn][pn][vn].getValue(pindexes[i]);
    if (typeof(value) === 'undefined') continue;
    if (collectionType !=='ASSOC' && value === emptyCollectionElement) continue;
    if (resType === -1) {
      resType = typeof(value) === 'object' ? 1 : 0;
    }
    if (resType === 0) {
      plv8.return_next({"column_value": value});
    } else {
      plv8.return_next(value);
    }
  }
}

$BODY$
LANGUAGE plv8;