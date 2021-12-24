CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$variable
(
    ctext       IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<var',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</var>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


