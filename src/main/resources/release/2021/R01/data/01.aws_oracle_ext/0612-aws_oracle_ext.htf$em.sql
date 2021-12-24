CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$em
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<em',
                     aws_oracle_ext.htf$ifnotnull(cattributes,concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</em>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


