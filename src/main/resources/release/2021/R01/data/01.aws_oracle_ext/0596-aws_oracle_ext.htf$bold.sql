CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$bold
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<b',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</b>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


