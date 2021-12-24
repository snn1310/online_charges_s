CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$htitle
(
    ctitle      IN TEXT,
    nsize       IN NUMERIC  DEFAULT 1,
    calign      IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     aws_oracle_ext.htf$title(ctitle),
                     aws_oracle_ext.htf$header(nsize,ctitle,calign,cnowrap,cclear,cattributes));

$BODY$
LANGUAGE SQL
IMMUTABLE;


