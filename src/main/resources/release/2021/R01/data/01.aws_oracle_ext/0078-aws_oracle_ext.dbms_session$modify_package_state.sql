CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$modify_package_state
(
   action_flags IN INTEGER
)
RETURNS VOID
AS
$BODY$
'use strict';
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  const cursors = plv8.execute(`
SELECT pc.name FROM pg_catalog.pg_cursors pc where name like '%$%$%'
`);
  for (let i = 0; i < cursors.length; i++) {
    try{
      plv8.subtransaction(function(){
        plv8.execute(`CLOSE ${cursors[i].name}`);
      });
    } catch(e) {
    }
  }
  for (let key of Object.keys(aws_oracle_ext)) {
    if (key === 'aws_oracle_ext') continue;
    delete aws_oracle_ext[key];
  }

$BODY$
LANGUAGE plv8;