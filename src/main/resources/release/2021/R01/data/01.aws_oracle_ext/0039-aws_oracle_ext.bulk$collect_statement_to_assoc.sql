CREATE OR REPLACE FUNCTION aws_oracle_ext.bulk$collect_statement_to_assoc
(
    pinto IN VARCHAR[],
    pprocedurename IN VARCHAR,
    pdataset IN JSON[]
)
RETURNS VOID
AS
$BODY$
'use strict';

if (pinto == null || typeof(pinto) === 'undefined' || !Array.isArray(pinto) || pinto.length < 1) plv8.elog(ERROR, 'Collection name is null or empty!');
if (pprocedurename == null || typeof(pprocedurename) === 'undefined' || pprocedurename.length < 1) plv8.elog(ERROR, 'Routine name is null or empty!');
if (pdataset == null || typeof(pdataset) === 'undefined' || !Array.isArray(pdataset)) plv8.elog(ERROR, 'Dataset(s) array is null or incorrect!');

if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
const caseCheck = plv8.find_function("aws_oracle_ext.check_identifier_case");
const split = require('StringUtils').splitBy;

const pathPartsArr = split(pprocedurename, ',', ['"']).filter((item) => item !=='').map((v) => v.trim()).map(parser);
if (pinto.length != pathPartsArr.length) plv8.elog(ERROR, 'The number of collections is not equal to the number of routines!');

for (let i = 0; i < pathPartsArr.length; i++) {
  if (pathPartsArr[i].length != 3) plv8.elog(ERROR, 'Incorrect routine name!');
  if (pathPartsArr[i][0].group === 'dot' || pathPartsArr[i][1].group !== 'dot' || pathPartsArr[i][2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');
}

const snArr = pathPartsArr.map((value) => value[0].text);
const pnArr = pathPartsArr.map((value) => value[2].text);
const chk = plv8.find_function("aws_oracle_ext.collectioncheck");
let collections = [];
for (let k = 0; k < pinto.length; k++) {
  const vn = caseCheck(pinto[k]);
  chk(snArr[k], pnArr[k], vn);
  if (aws_oracle_ext[snArr[k]][pnArr[k]][vn].indexBy !== 'BIGINT') plv8.elog(ERROR, 'Incorrect collection type!');
  const collectionType = aws_oracle_ext[snArr[k]][pnArr[k]][vn].collectionType;
  const rowType = aws_oracle_ext[snArr[k]][pnArr[k]][vn].rowType;
  const res = plv8.execute(`select aws_oracle_ext.record_to_json(NULL::${rowType}) as r`);
  const emptyObj = res[0].r;
  const keys = Object.keys(emptyObj);
  if (pinto.length > 1) {
    if (keys.length > 1 || (keys.length == 1 && keys[0] !== 'column_value')) {
      plv8.elog(ERROR, 'Incorrect collection type!');
    }
  }
  collections.push({collectionType: collectionType, rowType: rowType, keys: keys});
}

for (let k = 0; k < pinto.length; k++) {
  const vn = caseCheck(pinto[k]);
  const keys = collections[k].keys;
  
  const tree = new Tree(52);
  tree.indexBy = 'BIGINT';
  tree.collectionType = collections[k].collectionType;
  tree.rowType = collections[k].rowType;

  if (pdataset.length > 0) {
    const numberOfcolumns = Object.values(pdataset[0]).length;

    if (pinto.length > numberOfcolumns) plv8.elog(ERROR, 'ORA-00913: too many values');	 
    
    for (let i = 0; i < pdataset.length; i++) {
      const vdataset = pdataset[i].hasOwnProperty('bulk$fetch_cursor') ? pdataset[i]['bulk$fetch_cursor'] : pdataset[i];
      const values = Object.values(vdataset);
      if (keys.length == 1 && keys[0] === 'column_value') {
        tree.putValue(i + 1, values[k]);
      } else {
        const tempRec = {};
        for (let j = 0; j < keys.length; j++) {
          tempRec[keys[j]] = values[j];
        }
        tree.putValue(i + 1, tempRec);
      }
    }
  }
  aws_oracle_ext[snArr[k]][pnArr[k]][vn] = tree;
}


$BODY$
LANGUAGE plv8;