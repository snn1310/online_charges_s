CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$set_null
(
    IN p_array_path CHARACTER VARYING,
    IN p_procedure_name CHARACTER VARYING
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

const chk = plv8.find_function("aws_oracle_ext.collectioncheck");

pathParts = parser(p_array_path);
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

if (collectionType === 'ASSOC') {
  plv8.elog(ERROR, 'Incorrect collection type');
}

aws_oracle_ext[sn][pn][vn] = null;

$BODY$
LANGUAGE plv8;