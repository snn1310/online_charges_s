CREATE OR REPLACE FUNCTION aws_oracle_ext.spell_timestamp
(
    pval IN TIMESTAMP,
    pfmt IN VARCHAR
)
RETURNS VARCHAR
AS
$$
const options ={};
let fmt = pfmt;
if (/FF[1-9]?SP/i.test(pfmt)) {
    fmt = fmt.replace(/[1-9]/,'');
    let plan = plv8.prepare('select extract(epoch from $1) AS e', [ 'timestamp' ]);
    const rows = plan.execute([ pval ]);
    let stMs = String(rows[0].e);
   	stMs = stMs.slice(stMs.indexOf('.')).substring(0,6);
   	options.microseconds = Number(stMs);

    plan.free();
}
const spell = plv8.find_function("aws_oracle_ext.spell");
return spell(pval, fmt, options);
$$
STABLE
LANGUAGE plv8;