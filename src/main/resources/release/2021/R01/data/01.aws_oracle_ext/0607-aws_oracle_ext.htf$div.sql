CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$div
(
    calign       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<div',
                  aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                  aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                  '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;

                
