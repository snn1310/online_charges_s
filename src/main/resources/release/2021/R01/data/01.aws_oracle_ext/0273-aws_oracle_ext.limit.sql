CREATE OR REPLACE FUNCTION aws_oracle_ext.limit
(
    parray IN ANYELEMENT
)
RETURNS INTEGER
AS
$limit$
    /*the function is depricated. collection_%METHOD_NAME% has to be used instead*/
    SELECT
    COALESCE
    (
        SUBSTRING(SUBSTRING(pg_get_constraintdef(pc.oid) FROM '<=\s*\d+') FROM '\d+')::INTEGER,
        SUBSTRING(SUBSTRING(pg_get_constraintdef(pc.oid) FROM '<\s*\d+') FROM '\d+')::INTEGER - 1
    )
    FROM pg_constraint pc
    JOIN pg_type pt ON pt.oid = pc.contypid
    WHERE pt.typname = SUBSTRING(PG_TYPEOF(parray)::TEXT FROM POSITION('.' IN PG_TYPEOF(parray)::TEXT) + 1)
    AND pt.typcategory = 'A'
    AND pt.typtype = 'd'
    AND pc.conname LIKE '%_lim';

$limit$
STABLE
LANGUAGE SQL;
