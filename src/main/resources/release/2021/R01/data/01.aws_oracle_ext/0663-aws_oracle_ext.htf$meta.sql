CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$meta
(
    chttp_equiv IN TEXT,
    cname       IN TEXT,
    ccontent    IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('', 
                     '<meta http-equiv="',
                     chttp_equiv,
                     '" name="',
                     cname,
                     '" content="',
                     ccontent,
                     '">')

$BODY$
LANGUAGE SQL
IMMUTABLE;


