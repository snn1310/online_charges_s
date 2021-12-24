CREATE OR REPLACE FUNCTION aws_oracle_ext.packageinitialize
(
    IN proutinename TEXT,
    IN pforce BOOLEAN DEFAULT FALSE
)
RETURNS BOOLEAN
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
  let doInit = false;
  if (pforce) {
    let curMask = sn.charAt(0) === '"' ? sn.substring(1) : sn;
    curMask = sn.charAt(0) === '"' ? curMask.slice(0, -1) : curMask;
    curMask += '$';
    curMask += pn.charAt(0) === '"' ? pn.substring(1) : pn;
    curMask = pn.charAt(0) === '"' ? curMask.slice(0, -1) : curMask;
    const cursors = plv8.execute(`
SELECT pc.name FROM pg_catalog.pg_cursors pc where name like '%$${curMask}$%'
`);
    for (let i = 0; i < cursors.length; i++) {
      try{
        plv8.subtransaction(function(){
          plv8.execute(`CLOSE ${cursors[i].name}`);
        });
      } catch(e) {
      }
    }
    if (typeof(aws_oracle_ext) !== 'undefined') {
     if (aws_oracle_ext.hasOwnProperty(sn)) {
        delete aws_oracle_ext[sn][pn];
      }
    }
    return doInit;
  }
  if (typeof(aws_oracle_ext) === 'undefined') {
  aws_oracle_ext = {};
    doInit = true;
  }
  if (!aws_oracle_ext.hasOwnProperty(sn)) {
    aws_oracle_ext[sn] = {};
    doInit = true;
  }
  if (!aws_oracle_ext[sn].hasOwnProperty(pn)) {
    aws_oracle_ext[sn][pn] = {};
    doInit = true;
  }

  if (!aws_oracle_ext[sn][pn].hasOwnProperty('Init$$')) doInit = true;
  
  if (doInit) aws_oracle_ext[sn][pn]['Init$$'] = true;
  return doInit;


$BODY$
LANGUAGE plv8;