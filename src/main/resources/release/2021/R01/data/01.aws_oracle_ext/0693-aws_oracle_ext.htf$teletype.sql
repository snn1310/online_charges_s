CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$teletype
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<tt',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</tt>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


