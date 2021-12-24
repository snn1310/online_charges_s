CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_element_delete
(
    IN p_routine_name TEXT,
    IN p_collection_path TEXT,
    IN p_start TEXT DEFAULT NULL,
    IN p_end TEXT DEFAULT NULL
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
const collectionType = aws_oracle_ext[sn][pn][vn].collectionType;
const rowType = aws_oracle_ext[sn][pn][vn].rowType;

let numArgs = 0;
let start;
let end;
if (p_start !== null && p_end === null) {
  numArgs = 1;
  start = indexBy === 'BIGINT' ? Number(p_start) : p_start;
  if (indexBy === 'BIGINT' && isNaN(start)) {
    plv8.elog(ERROR, 'Incorrect value for index');
  }
}
if (p_start !== null && p_end !== null) {
  numArgs = 2;
  start = indexBy === 'BIGINT' ? Number(p_start) : p_start;
  if (indexBy === 'BIGINT' && isNaN(start)) {
    plv8.elog(ERROR, 'Incorrect value for index');
  }
  end = indexBy === 'BIGINT' ? Number(p_end) : p_end;
  if (indexBy === 'BIGINT' && isNaN(end)) {
    plv8.elog(ERROR, 'Incorrect value for index');
  }
}

switch(numArgs) {
  case 1:
    if (typeof(aws_oracle_ext[sn][pn][vn].getValue(start)) === 'undefined') return;
    
    if (collectionType !== 'ASSOC') {
      aws_oracle_ext[sn][pn][vn].putValue(start, emptyCollectionElement);
    } else {
      aws_oracle_ext[sn][pn][vn].del(start);
    }
    break;
  case 2:
    if (indexBy === 'STRING') {
      if(TreeUtility.stringCompare(end, start) < 0 ) return;
    } else {
      if (end < start) return;
    }
    if (typeof(aws_oracle_ext[sn][pn][vn].getValue(start)) === 'undefined') return;
    if (typeof(aws_oracle_ext[sn][pn][vn].getValue(end)) === 'undefined') return;
    
    let indices = [];
    aws_oracle_ext[sn][pn][vn].walkAsc(start, end, function(key, value){
      indices.push(key);
    });

    for (let i = 0; i < indices.length; i++) {
      if (collectionType !== 'ASSOC') {
        aws_oracle_ext[sn][pn][vn].putValue(indices[i], emptyCollectionElement);
      } else {
        aws_oracle_ext[sn][pn][vn].del(indices[i]);
      }
    }
    
    break;
  default:
      const tree = indexBy == 'BIGINT' ? new Tree(52)  : new Tree(52, TreeUtility.stringCompare);
      tree.indexBy = indexBy;
      tree.collectionType = collectionType;
      tree.rowType = rowType;
      aws_oracle_ext[sn][pn][vn] = tree;
    break;
}

$BODY$
LANGUAGE plv8;