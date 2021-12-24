CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$kbd
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<kbd',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ',cattributes)),
                     '>',
                     ctext,
                     '</kbd>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


