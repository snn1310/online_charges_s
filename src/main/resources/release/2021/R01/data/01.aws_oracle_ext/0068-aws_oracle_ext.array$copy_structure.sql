CREATE OR REPLACE FUNCTION aws_oracle_ext.array$copy_structure
(
   IN p_source_param_name VARCHAR,
   IN p_source_procedure_name VARCHAR,
   IN p_dest_param_name VARCHAR,
   IN p_dest_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const chk = plv8.find_function("aws_oracle_ext.collectioncheck");
const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
const caseCheck = plv8.find_function("aws_oracle_ext.check_identifier_case");
const pathParts = parser(p_source_procedure_name);
if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot')
  plv8.elog(ERROR, 'Incorrect routine name');

const srcsn = pathParts[0].text;
const srcp = pathParts[2].text;
const srccol = caseCheck(p_source_param_name);
chk(srcsn, srcp, srccol);
const indexBy = aws_oracle_ext[srcsn][srcp][srccol].indexBy;
const rowType = aws_oracle_ext[srcsn][srcp][srccol].rowType;
const doCreate = plv8.find_function("aws_oracle_ext.array$create_array");
const setRowtype = plv8.find_function("aws_oracle_ext.array$create_storage_table");
doCreate(p_dest_param_name, p_dest_procedure_name, null, indexBy);
setRowtype(p_dest_param_name, p_dest_procedure_name, rowType);

$BODY$
LANGUAGE plv8;