CREATE OR REPLACE FUNCTION aws_oracle_ext.array$create_storage_table
(
    p_array_name IN VARCHAR,
    p_procedure_name IN VARCHAR,
    p_cast_type_name IN VARCHAR,
    pWithData            IN BOOLEAN DEFAULT TRUE
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
const caseCheck = plv8.find_function("aws_oracle_ext.check_identifier_case");
const pathParts = parser(p_procedure_name);

if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');

const sn = pathParts[0].text;
const pn = pathParts[2].text;
const chk = plv8.find_function("aws_oracle_ext.collectioncheck");
const srccol = caseCheck(p_array_name);
chk(sn, pn, srccol);
aws_oracle_ext[sn][pn][srccol].rowType = p_cast_type_name;

$BODY$
LANGUAGE plv8;