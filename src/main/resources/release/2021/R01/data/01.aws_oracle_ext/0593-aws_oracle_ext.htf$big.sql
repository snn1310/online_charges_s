CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$big
(
    ctext         IN TEXT,
    cattributes   IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<big',
                     aws_oracle_ext.htf$IFNOTNULL(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</big>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


