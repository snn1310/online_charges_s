CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$strong
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<strong',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</strong>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


