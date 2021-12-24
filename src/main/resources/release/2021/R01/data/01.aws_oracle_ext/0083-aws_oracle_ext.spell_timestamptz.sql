CREATE OR REPLACE FUNCTION aws_oracle_ext.spell_timestamptz
(
    pval IN TIMESTAMP WITH TIME ZONE,
    pfmt IN VARCHAR
)
RETURNS VARCHAR
AS
$$
const options ={};
const spell = plv8.find_function("aws_oracle_ext.spell");
let fmt = pfmt;
if (/FF[1-9]?SP/i.test(pfmt)) {
    fmt = fmt.replace(/[1-9]/,'');
    let plan = plv8.prepare('select extract(epoch from $1) AS e', [ 'timestamptz' ]);
    const rows = plan.execute([ pval ]);
    let stMs = String(rows[0].e);
   	stMs = stMs.slice(stMs.indexOf('.')).substring(0,6);
   	options.microseconds = Number(stMs);

    plan.free();
    return spell(pval, pfmt, options);
}
if (/TZHSP/i.test(pfmt)) {
    let plan = plv8.prepare('select extract(TIMEZONE_HOUR from $1) AS e', [ 'timestamptz' ]);
    const rows = plan.execute([ pval ]);
   	options.tzh = rows[0].e;

    plan.free();
    return spell(pval, pfmt, options);
}

if (/TZMSP/i.test(pfmt)) {
    let plan = plv8.prepare('select extract(TIMEZONE_MINUTES from $1) AS e', [ 'timestamptz' ]);
    const rows = plan.execute([ pval ]);
   	options.tzm = rows[0].e;

    plan.free();
    return spell(pval, pfmt, options);
}


$$
STABLE
LANGUAGE plv8;