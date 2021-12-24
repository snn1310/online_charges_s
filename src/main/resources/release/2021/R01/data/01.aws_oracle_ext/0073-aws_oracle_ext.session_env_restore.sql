CREATE OR REPLACE FUNCTION aws_oracle_ext.session_env_restore
(
  IN session_env JSON
) 
RETURNS BOOLEAN
AS
$BODY$
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  if (session_env == null || typeof(session_env) !== 'object') {
    plv8.elog(ERROR, 'Incorrect argument for session_env_restore call!');
  }
  let result = false;
  const schemas = Object.getOwnPropertyNames(session_env);
  const setVariable = function setVariable(schema, package, variable, value) {
    if(typeof(value) !== 'object' || value == null || value instanceof Date) {
      if (!(aws_oracle_ext[schema][package][variable] instanceof Tree)) {
        aws_oracle_ext[schema][package][variable] = value;
      }
    } else {
      if (!value.hasOwnProperty('collectionType')) {
        aws_oracle_ext[schema][package][variable] = value;
      } else {
        const tree = value.indexBy == 'BIGINT' ? new Tree(52)  : new Tree(52, TreeUtility.stringCompare);
        tree.indexBy = value.indexBy;
        tree.collectionType = value.collectionType;
        tree.rowType = value.rowType;
        for (let i = 0; i < value.value.length; i++) {
          let v;
          if (!value.value[i].v.hasOwnProperty('empty')) {
            v = value.value[i].v;
          } else {
            v = emptyCollectionElement;
          }
          tree.putValue(value.value[i].k, v);
        }
        aws_oracle_ext[schema][package][variable] = tree;
      }
    }
  };

  for (let i = 0; i < schemas.length; i++) {
    if (schemas[i] !== 'aws_oracle_ext') {
      const packages = Object.getOwnPropertyNames(session_env[schemas[i]]);
      for (let j = 0; j < packages.length; j++) {
        if (typeof(aws_oracle_ext) === 'undefined') {
          aws_oracle_ext = {};
          if (!result) result = true;
        }
        if (!aws_oracle_ext.hasOwnProperty(schemas[i])) {
          aws_oracle_ext[schemas[i]] = {};
          if (!result) result = true;
        }
        if(!aws_oracle_ext[schemas[i]].hasOwnProperty(packages[j])) {
          aws_oracle_ext[schemas[i]][packages[j]] = {};
          if (!result) result = true;
        }
        const initSql = `SELECT ${schemas[i]}.${packages[j]}$Init()`;
        if (!aws_oracle_ext[schemas[i]][packages[j]].hasOwnProperty('Init$$')) {
          plv8.execute(initSql);
        }
        const vars = Object.getOwnPropertyNames(session_env[schemas[i]][packages[j]]);
        for (let k = 0; k < vars.length; k++) {
          if (vars[k] !== 'Init$$') {
            setVariable(schemas[i], packages[j], vars[k],  session_env[schemas[i]][packages[j]][vars[k]]);
            if (!result) result = true;
          }
        }       
      }
    }
  }
  return result;

$BODY$
LANGUAGE plv8;