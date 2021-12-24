CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$strike
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<strike',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</strike>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


