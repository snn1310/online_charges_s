CREATE OR REPLACE FUNCTION aws_oracle_ext.array$create_array
(
    IN p_array_name VARCHAR,
    IN p_procedure_name VARCHAR,
    IN p_parent_array_id BIGINT DEFAULT NULL,
    IN pindexby TEXT DEFAULT 'BIGINT'
)
RETURNS BIGINT
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
const indexBy = pindexby != 'BIGINT' ? 'STRING' : 'BIGINT';
const tree = indexBy == 'BIGINT' ? new Tree(52)  : new Tree(52, TreeUtility.stringCompare);
tree.indexBy = indexBy;
tree.collectionType = 'ASSOC';

if (typeof(aws_oracle_ext) === 'undefined') aws_oracle_ext = {};
if (!aws_oracle_ext.hasOwnProperty(sn)) aws_oracle_ext[sn] = {};
if (!aws_oracle_ext[sn].hasOwnProperty(pn)) aws_oracle_ext[sn][pn] = {};

aws_oracle_ext[sn][pn][caseCheck(p_array_name)] = tree;

return -1;

$BODY$
LANGUAGE plv8;