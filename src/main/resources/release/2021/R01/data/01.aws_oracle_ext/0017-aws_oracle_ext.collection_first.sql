CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_first
(
    IN p_routine_name TEXT,
    IN p_collection_path TEXT,
    IN p_tp ANYELEMENT DEFAULT NULL::TEXT
)
RETURNS ANYELEMENT
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

const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;

let result = null;
aws_oracle_ext[sn][pn][vn].walkAsc(null, null, function(key, value){
  if (collectionType === 'ASSOC') {
    result = key;
    return true;
  } else {
    if (value !== emptyCollectionElement) {
      result = key;
      return true;
    }
  }
});

return result;

$BODY$
LANGUAGE plv8;