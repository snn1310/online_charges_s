CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$extend
(
    IN p_array_path VARCHAR,
    IN p_quantity_of_elements BIGINT,
    IN p_element_for_copy BIGINT,
    IN p_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
let pathParts = parser(p_procedure_name);

if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');

const sn = pathParts[0].text;
const pn = pathParts[2].text;

pathParts = parser(p_array_path);
const pathlength = pathParts.length;
if (pathlength != 1) {
  plv8.elog(ERROR, 'Nested collection is not supported');
}
if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
  plv8.elog(ERROR, 'Incorrect collection path');
}
const vn = pathParts[0].text;

const chk = plv8.find_function("aws_oracle_ext.collectioncheck");
chk(sn, pn, vn);

const errorMessage = `PLS-00306: wrong number or types of arguments in call to 'EXTEND'`;

if (aws_oracle_ext[sn][pn][vn] != null) {
  if (aws_oracle_ext[sn][pn][vn].collectionType !== 'NT') {
    plv8.elog(ERROR, errorMessage);
  }
}

const quantity = p_quantity_of_elements === null ? 1 : Number(p_quantity_of_elements);
if (isNaN(quantity)) {
  plv8.elog(ERROR, errorMessage);
}

const srcIdx = p_element_for_copy === null ? null : Number(p_element_for_copy);

if ( srcIdx !== null &&  isNaN(srcIdx)) {
  plv8.elog(ERROR, errorMessage);
}

let fillValue = null;

if (srcIdx !== null) {
  fillValue = aws_oracle_ext[sn][pn][vn].getValue(srcIdx);
  if (typeof(fillValue) === 'undefined') {
    plv8.elog(ERROR, `ORA-06533: Subscript beyond count`);
  }
  if (typeof(fillValue) === 'object' && fillValue == emptyCollectionElement) {
    plv8.elog(ERROR, `ORA-01403: no data found`);
  }
}

let lastIdx = 0;
const cnt = aws_oracle_ext[sn][pn][vn].count();
if (cnt > 0 ) {
  aws_oracle_ext[sn][pn][vn].walkDesc(null,null, function(key, value){
    lastIdx = key;
    return true;
  });
}

for (let i = 1; i<= quantity; i++) {
  lastIdx++;
  aws_oracle_ext[sn][pn][vn].putValue(lastIdx, fillValue);  
}

$BODY$
LANGUAGE plv8;