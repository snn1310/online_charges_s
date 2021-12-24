CREATE OR REPLACE FUNCTION aws_oracle_ext.session_env_store
(   
  IN setting_list     TEXT,
  IN use_setting_list BOOLEAN DEFAULT TRUE
)
RETURNS JSON
AS
$BODY$
  if (setting_list == null) return null;

  const result = {};
  if (typeof(aws_oracle_ext) === 'undefined') return result;
  if (typeof(require) !== 'function') {
    const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
    initColl();
  }
  const schemas = Object.getOwnPropertyNames(aws_oracle_ext);

  const returnValue = function returnValue(schema, package, variable) {
    let result;
    if (aws_oracle_ext[schema][package][variable] instanceof Tree) {

      let res = [];
      let collectionType;
      aws_oracle_ext[schema][package][variable].walkAsc(null, null, function(key,value) {
        if (typeof(collectionType) === 'undefined') collectionType = aws_oracle_ext[schema][package][variable].collectionType;
        if (collectionType === 'ASSOC') {
          res.push({k: key, v: value});
        } else {
          const pvalue = value !== emptyCollectionElement ? value : {empty: true};
          res.push({k: key, v: pvalue});
        }
      });
      result = {
        value: res,
        collectionType: collectionType,
        indexBy: aws_oracle_ext[schema][package][variable].indexBy,
        rowType: aws_oracle_ext[schema][package][variable].rowType
      };
    } else {
      result = aws_oracle_ext[schema][package][variable];
    }
    return result;
  };

  if (!use_setting_list) {

    for (let i = 0; i < schemas.length; i++) {
      
    if (schemas[i] !== 'aws_oracle_ext') {
      if (!result.hasOwnProperty(schemas[i])) result[schemas[i]] = {};
      const packages = Object.getOwnPropertyNames(aws_oracle_ext[schemas[i]]);
      for (let j = 0; j < packages.length; j++) {

        if(!result[schemas[i]].hasOwnProperty(packages[j])) result[schemas[i]][packages[j]] = {};
        const vars = Object.getOwnPropertyNames(aws_oracle_ext[schemas[i]][packages[j]]);
        for (let k = 0; k < vars.length; k++) {
          if (vars[k] !== 'init$$') {
            result[schemas[i]][packages[j]][vars[k]] = returnValue(schemas[i], packages[j], vars[k]);
          }
        }

      }
    }

    }

  } else {

    const split = require('StringUtils').splitBy;
    const passed = split(setting_list, ',', ['"'])
      .filter((item) => item !=='');

    if (passed.length > 0) {

      const searchList = {};
      const caseCheck = plv8.find_function("aws_oracle_ext.check_identifier_case");

      for (let i = 0; i < passed.length; i++) {

        const varray = split(passed[i], '.', '"' )
          .filter((item) => item !=='');
        if (varray.length != 3) plv8.elog(ERROR, `Incorrect filter entry ${passed[i]}`);
        const sn = caseCheck(varray[0]);
        const pn = caseCheck(varray[1]);
        const vn = caseCheck(varray[2]);
        if (!searchList.hasOwnProperty(sn)) searchList[sn] = {};
        if (!searchList[sn].hasOwnProperty(pn)) searchList[sn][pn] = {};
        searchList[sn][pn][vn] = null;

      }

      const s = Object.getOwnPropertyNames(searchList);
      const schemasFiltered = schemas.filter(function(item) {
        return s.includes(item);
      });

      for (let i = 0; i < schemasFiltered.length; i++) {

        if (!result.hasOwnProperty(schemasFiltered[i])) result[schemasFiltered[i]] = {};
        const p = Object.getOwnPropertyNames(searchList[schemasFiltered[i]]);
        const packagesFiltered = Object.getOwnPropertyNames(aws_oracle_ext[schemasFiltered[i]]).filter(function(item) {
          return p.includes(item);

        });

        for (let j = 0; j < packagesFiltered.length; j++) {
          const v = Object.getOwnPropertyNames(searchList[schemasFiltered[i]][packagesFiltered[j]]);

          const varsFiltered = Object.getOwnPropertyNames(aws_oracle_ext[schemasFiltered[i]][packagesFiltered[j]]).filter(function(item) {
            return v.includes(item);
          });

          for (let k = 0; k < varsFiltered.length; k++) {

            if(!result[schemasFiltered[i]].hasOwnProperty(packagesFiltered[j])) result[schemasFiltered[i]][packagesFiltered[j]] = {};
            result[schemasFiltered[i]][packagesFiltered[j]][varsFiltered[k]] = returnValue(schemasFiltered[i], packagesFiltered[j], varsFiltered[k]);

          }

        }
      }
    }
  }
  return result;

$BODY$
LANGUAGE plv8;