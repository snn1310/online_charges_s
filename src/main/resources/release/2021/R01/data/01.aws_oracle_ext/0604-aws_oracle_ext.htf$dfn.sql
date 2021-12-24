CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$dfn
(
    ctext       IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<dfn',
                     aws_oracle_ext.htf$IFNOTNULL(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</dfn>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


