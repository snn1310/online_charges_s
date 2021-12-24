CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$sup
(
    ctext         IN TEXT,
    calign        IN TEXT DEFAULT NULL,
    cattributes   IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<sup',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext,
                     '</sup>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


