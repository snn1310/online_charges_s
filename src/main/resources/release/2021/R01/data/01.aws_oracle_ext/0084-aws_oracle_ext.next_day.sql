CREATE OR REPLACE FUNCTION aws_oracle_ext.next_day
(
    IN ddate TIMESTAMP,
    IN cchar TEXT
)
RETURNS TIMESTAMP
IMMUTABLE
AS
$BODY$
if (typeof(require) !== 'function') {
   const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
   initColl();
 }
 let dnum;
 const weekdays = ['Mon', 'Tue', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
 for (let i=0; i < 7; i++) {
  let re = RegExp(weekdays[i], "i");
  if (re.test(cchar)) dnum = i + 1;
 }
 const dn = ddate.getDay();
 const odn = dn == 0 ? 7 : dn + 1;
 const off = odn > dnum ? 7 + dnum - odn + 1 : dnum - odn + 1;
 return new Date(ddate.getTime() + (off*24*60*60*1000));
$BODY$
LANGUAGE plv8;