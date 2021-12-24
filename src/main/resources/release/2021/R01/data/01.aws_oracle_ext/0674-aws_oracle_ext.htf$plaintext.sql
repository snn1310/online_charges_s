CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$plaintext
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<plaintext',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</plaintext>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


