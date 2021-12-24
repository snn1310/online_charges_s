CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$code
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<code',
                     aws_oracle_ext.htf$IFNOTNULL(cattributes, concat_ws('', ' ', cattributes)),
                     '>', 
                     ctext, 
                     '</code>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


