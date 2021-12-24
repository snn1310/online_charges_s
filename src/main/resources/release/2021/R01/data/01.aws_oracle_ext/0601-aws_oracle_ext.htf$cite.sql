CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$cite
(
    ctext       IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<cite',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</cite>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


