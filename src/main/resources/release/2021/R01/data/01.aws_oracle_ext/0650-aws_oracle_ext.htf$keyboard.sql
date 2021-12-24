CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$keyboard
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT aws_oracle_ext.htf$kbd(ctext,cattributes);

$BODY$
LANGUAGE SQL
IMMUTABLE;


