CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$underline
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<u',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</u>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


