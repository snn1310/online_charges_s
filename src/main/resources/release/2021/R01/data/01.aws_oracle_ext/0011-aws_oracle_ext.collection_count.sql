CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_count
(
    IN p_routine_name TEXT,
    IN p_collection_path TEXT
)
RETURNS BIGINT
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

const collectioncheck = plv8.find_function("aws_oracle_ext.collectioncheck");

pathParts = parser(p_collection_path);
const pathlength = pathParts.length;

if (pathlength != 1) {
  plv8.elog(ERROR, 'Nested collection is not supported');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}

const vn = pathParts[0].text;
collectioncheck(sn, pn, vn);

const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;

let cnt = 0;
if (collectionType === 'ASSOC') {
  cnt = aws_oracle_ext[sn][pn][vn].count();
} else {
  aws_oracle_ext[sn][pn][vn].walkAsc(null, null, function(key, value){
    if (value !== emptyCollectionElement) cnt++;
  });
}

return cnt;

$BODY$
LANGUAGE plv8;