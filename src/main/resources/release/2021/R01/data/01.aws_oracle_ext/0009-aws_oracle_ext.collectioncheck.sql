CREATE OR REPLACE FUNCTION aws_oracle_ext.collectioncheck
(
    IN sn TEXT,
    IN pn TEXT,
    IN vn TEXT
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
if (typeof(aws_oracle_ext) === 'undefined') plv8.elog(ERROR, 'Collection does not exist!');
if (!aws_oracle_ext.hasOwnProperty(sn)) plv8.elog(ERROR, 'Collection does not exist!');
if (!aws_oracle_ext[sn].hasOwnProperty(pn)) plv8.elog(ERROR, 'Collection does not exist!');
if (!aws_oracle_ext[sn][pn].hasOwnProperty(vn)) plv8.elog(ERROR, 'Collection does not exist!');
if (aws_oracle_ext[sn][pn][vn]!== null && !(aws_oracle_ext[sn][pn][vn] instanceof Tree)) plv8.elog(ERROR, 'Variable is not a collection!');

$BODY$
LANGUAGE plv8;