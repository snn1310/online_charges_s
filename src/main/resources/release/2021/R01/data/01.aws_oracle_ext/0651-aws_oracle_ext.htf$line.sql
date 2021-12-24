CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$line
(
    cclear      IN TEXT DEFAULT NULL,
    csrc        IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT aws_oracle_ext.htf$hr(cclear, csrc, cattributes);

$BODY$
LANGUAGE SQL
IMMUTABLE;


