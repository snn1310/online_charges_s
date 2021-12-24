CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$s
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<s',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</s>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


