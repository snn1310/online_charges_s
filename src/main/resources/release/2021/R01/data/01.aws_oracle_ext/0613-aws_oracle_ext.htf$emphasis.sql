CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$emphasis
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT aws_oracle_ext.htf$em(ctext,cattributes);

$BODY$
LANGUAGE SQL
IMMUTABLE;


