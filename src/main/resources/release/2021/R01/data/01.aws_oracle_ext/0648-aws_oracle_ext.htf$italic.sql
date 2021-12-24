CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$italic
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<i',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ',cattributes)),
                     '>',
                     ctext,
                     '</i>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


