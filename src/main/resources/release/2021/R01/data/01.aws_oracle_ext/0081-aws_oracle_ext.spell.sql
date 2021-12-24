CREATE OR REPLACE FUNCTION aws_oracle_ext.spell
(
	pval IN INTERNAL,
    pmodel IN INTERNAL,
    poptions IN INTERNAL
)
RETURNS TEXT
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const StringUtils = require('StringUtils');
const models = {
  "SSSP": () => pval.getSeconds(),
  "Y,YYYSP": () => pval.getFullYear(),
  "SYYYYSP": () => pval.getFullYear(),
  "YYYYSP": () => pval.getFullYear(),
  "YYYSP": () => String(pval.getFullYear()).substring(1),
  "YYSP": () => String(pval.getFullYear()).substring(2),
  "YSP": () => String(pval.getFullYear()).substring(3),
  "SCCSP": () => Math.ceil((pval.getFullYear() - 1) / 100),
  "CCSP": () => Math.ceil((pval.getFullYear() - 1) / 100),
  "RRRRSP": () => pval.getFullYear(),
  "RRSP": () => String(pval.getFullYear()).substring(2),
  "HH24SP": () => pval.getHours(),
  "HH12SP": () => {let hours = pval.getHours() % 12; return (hours == 0 ? 12 : hours);},
  "HHSP": () => {let hours = pval.getHours() % 12; return (hours == 0 ? 12 : hours);},
  "DDDSP": () => (Date.UTC(pval.getFullYear(), pval.getMonth(), pval.getDate()) - Date.UTC(pval.getFullYear(), 0, 0)) / 24 / 60 / 60 / 1000,
  "DDSP": () => pval.getDate(),
  "MISP": () => pval.getMinutes(),
  "MMSP": () => pval.getMonth() + 1,
  "QSP": () => Math.ceil(pval.getMonth() / 3),
  "WWSP": () => Math.floor((((Date.UTC(pval.getFullYear(), pval.getMonth(), pval.getDate()) - Date.UTC(pval.getFullYear(), 0, 0)) / 24 / 60 / 60 / 1000) + 6) / 7),
  "WSP": Math.ceil(pval.getDate() / 7),
  "IYYYSP": () => {let date = new Date(pval.getTime()); date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7); return date.getFullYear(); },
  "IYYSP": () => {let date = new Date(pval.getTime()); date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7); return String(date.getFullYear()).substring(1); },
  "IYSP": () => {let date = new Date(pval.getTime()); date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7); return String(date.getFullYear()).substring(2); },
  "ISP": () => {let date = new Date(pval.getTime()); date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7); return String(date.getFullYear()).substring(3); },
  "IWSP": () => {
    let date = new Date(pval.getTime());
    date.setHours(0, 0, 0, 0);
    date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7);
    let week1 = new Date(date.getFullYear(), 0, 4);
    return 1 + Math.round(((date.getTime() - week1.getTime()) / 86400000 - 3 + (week1.getDay() + 6) % 7) / 7);
  },
  "JSP": () => Math.floor(pval.getTime() /86400000 - (pval.getTimezoneOffset() / 1440) + 2440587.5) + 1,
  "FFSP": () => poptions.microseconds * 1000000000,
  "TZHSP": () => Math.abs(poptions.tzh),
  "TZMSP": () => Math.abs(poptions.tzm),
};
  
  let res = StringUtils.numToWords(models[pmodel.toUpperCase()]());

  if (/^[A-Z]\,?[A-Z]/.test(pmodel)) res = res.toUpperCase();
  if(/^[A-Z][a-z]/.test(pmodel)) {
    if (res.indexOf('-') == -1) {
      res = StringUtils.toTitleCase(res);
    } else {
      let tmpres = StringUtils.toTitleCase(res.replaceAll('-', ' '));
      const dashIndexes = [];
      [...res].forEach((e, idx) => {
        if (e === '-') dashIndexes.push(idx);
      });
      for (let i = 0; i < dashIndexes.length; i++) {
        tmpres = StringUtils.replaceAtposition(tmpres, dashIndexes[i], '-');
      }
      res = tmpres;
    }
  }
  return res.trim();

$BODY$
LANGUAGE plv8;