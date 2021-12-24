CREATE OR REPLACE FUNCTION aws_oracle_ext.setglobalvariable
(
    IN proutinename TEXT,
    IN pvariable TEXT,
    IN pval ANYELEMENT DEFAULT NULL::TEXT,
    IN poptions JSON DEFAULT NULL
)
RETURNS VOID
AS
$BODY$
'use strict';
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  const parser = plv8.find_function("aws_oracle_ext.collection_path_parse");
  const PackageTools = require('PackageTools');
  let parts = parser(proutinename);
  if (parts.length != 3) plv8.elog(ERROR, 'Incorrect routine name');
  const sn = parts[0].text;
  const pn = parts[2].text;
  
  parts = parser(pvariable);
  const recordTarget = parts.length == 1 ? false : true;
  const vn = parts[0].text;
  const valuePath = parts.slice(1);
  let writable = true;

  let isConstant = false;
  let srcGlobal = false;
  if (poptions != null && typeof(poptions) === 'object') {
    if (poptions.hasOwnProperty('constant')) isConstant = true;
    if (poptions.hasOwnProperty('srcGlobal')) srcGlobal = true;
  }

  if (typeof(aws_oracle_ext) === 'undefined')aws_oracle_ext = {};
  if (!aws_oracle_ext.hasOwnProperty(sn)) aws_oracle_ext[sn] = {};
  if (!aws_oracle_ext[sn].hasOwnProperty(pn)) aws_oracle_ext[sn][pn] = {};
  
  if (!aws_oracle_ext[sn][pn].hasOwnProperty('Init$$')) {
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
  
  

  let val;

  if (!srcGlobal) {
    val = pval;
  } else {
    parts = parser(poptions['srcGlobal']);
    const srcsn = parts[0].text;
    const srcpn = parts[2].text;
    const srcvaluePath = parts.slice(4);
    const srcvn = srcvaluePath[0].text;
    if (sn === srcsn && pn === srcpn && PackageTools.partsCompare(valuePath, srcvaluePath)) return;
    if (srcvaluePath.length == 1) {
      val = aws_oracle_ext[srcsn][srcpn][srcvn];
    } else {
      val = PackageTools.getRecordField(aws_oracle_ext[srcsn][srcpn][srcvn], srcvaluePath.slice(1));
    }
  }
  let isRecord = false;
  if (typeof(val) === 'undefined' || val == null || typeof(val) !== 'object' || val instanceof Date) {
    if (isConstant) writable = false;
  } else {
    isRecord = true;
    writable = false;
    if (isConstant) {
      val = PackageTools.deepFreeze(val);
    }
  }
  if (!aws_oracle_ext[sn][pn].hasOwnProperty(vn)) {
    Object.defineProperty(aws_oracle_ext[sn][pn], vn,
      {
        value: val,
        writable : writable,
        enumerable : true,
        configurable : false
      }
    );
  } else {
    if (!recordTarget) {
      if (!isRecord && (typeof(aws_oracle_ext[sn][pn][vn]) !== 'object' || aws_oracle_ext[sn][pn][vn] == null || aws_oracle_ext[sn][pn][vn] instanceof Date)) {
        aws_oracle_ext[sn][pn][vn] = val;
      } else {
        PackageTools.deepCopy(val, aws_oracle_ext[sn][pn][vn]);
      }
    } else {
      PackageTools.setRecordField(aws_oracle_ext[sn][pn][vn], valuePath, val);
    }
  }

$BODY$
LANGUAGE plv8;