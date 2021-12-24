CREATE OR REPLACE FUNCTION aws_oracle_ext.bulk$getvaluesforindex
(
    parrayname     IN VARCHAR,
    pprocedurename IN VARCHAR,
    pvalues        IN BOOLEAN,
    pbetween       IN NUMERIC[] DEFAULT NULL
)
RETURNS BIGINT[]
AS
$BODY$
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
  let pathParts = parser(pprocedurename);

  if (pathParts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
  if (pathParts[0].group === 'dot' || pathParts[1].group !== 'dot' || pathParts[2].group === 'dot') plv8.elog(ERROR, 'Incorrect routine name');
  const sn = pathParts[0].text;
  const pn = pathParts[2].text;

  const chk = plv8.find_function("aws_oracle_ext.collectioncheck");

  pathParts = parser(parrayname);
  const pathlength = pathParts.length;

  if (pathlength != 1) {
    plv8.elog(ERROR, 'Nested collection is not supported');
  }
  if (pathParts[0].group === 'idx' || pathParts[0].group === 'dot') {
    plv8.elog(ERROR, 'Incorrect collection path');
  }

  const vn = pathParts[0].text;
  chk(sn, pn, vn);

  if (aws_oracle_ext[sn][pn][vn].collectionType !== 'ASSOC' && pvalues) {
    plv8.elog(ERROR, 'Incorrect collection type');
  }

  if (aws_oracle_ext[sn][pn][vn].indexBy !== 'BIGINT') {
    plv8.elog(ERROR, 'Incorrect index type');
  }
  let result = [];
  if (pvalues && pbetween != null) {
    plv8.elog(ERROR, 'VALUES OF does not support BETWEEN');
  }

  let sidx = null;
  let eidx = null;

  if (pbetween != null && pbetween.length == 2) {
    if (pbetween[0] == null || pbetween[1] == null) {
      return result;
    }
    sidx = pbetween[0] != null ? Math.round(pbetween[0]) : null;
    const fFirst = plv8.find_function("aws_oracle_ext.collection_first");
    const first = fFirst(pprocedurename, parrayname);
    if (sidx < first) sidx = first;
    eidx = pbetween[1] != null ? Math.round(pbetween[1]) : null;
    if (eidx < sidx) return result;
  }

  aws_oracle_ext[sn][pn][vn].walkAsc(sidx, eidx, function(key, value) {
    if (!pvalues) {
      if (aws_oracle_ext[sn][pn][vn].collectionType === 'ASSOC' || ( aws_oracle_ext[sn][pn][vn].collectionType !== 'ASSOC' && value !== emptyCollectionElement))
      {
        result.push(key);
      }
    } else {
      result.push(value);
    }
  });

  return result;

$BODY$
LANGUAGE plv8;
