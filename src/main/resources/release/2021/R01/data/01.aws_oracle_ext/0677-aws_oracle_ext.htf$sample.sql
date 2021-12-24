CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$sample
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<samp',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</samp>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


