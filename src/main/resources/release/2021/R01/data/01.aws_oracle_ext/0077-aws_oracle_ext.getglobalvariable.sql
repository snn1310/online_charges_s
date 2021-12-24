CREATE OR REPLACE FUNCTION aws_oracle_ext.getglobalvariable
(
    IN proutinename TEXT,
    IN pvariable TEXT,
    IN ptp ANYELEMENT
)
RETURNS ANYELEMENT STABLE
AS
$BODY$
'use strict';
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
  let parts = parser(proutinename);
  if (parts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
  const sn = parts[0].text;
  const pn = parts[2].text;
  
  let doSQLInit = (typeof(aws_oracle_ext) === 'undefined');
  
  if (!doSQLInit) doSQLInit = !aws_oracle_ext.hasOwnProperty(sn);
  
  if (!doSQLInit) doSQLInit = !aws_oracle_ext[sn].hasOwnProperty(pn);
  
  if (!doSQLInit) doSQLInit = !aws_oracle_ext[sn][pn].hasOwnProperty('Init$$');
  
  if (doSQLInit) {
    let x = '$$';
    for (let i = 0; i < 16; i++) {
        if (sn.includes(x) || pn.includes(x)) {
            x = `$aws${(+((new Date).setMilliseconds(i))).toString(36)}$`;
            } 
        else {
            break;
            }
        }
    plv8.execute(`do language plpgsql ${x}begin PERFORM ${sn}.${pn}$Init(); end;${x}`);
    }
  
  parts = parser(pvariable);
  const getField = require('PackageTools').getRecordField;
  const result = getField(aws_oracle_ext[sn][pn], parts);
  return result;

$BODY$
LANGUAGE plv8;