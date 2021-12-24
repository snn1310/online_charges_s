CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$appletOpen
(
    ccode     IN TEXT,
    cwidth    IN NUMERIC,
    cheight    IN NUMERIC,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<applet code=',
                     ccode,
                     ' width=',cwidth,
                     ' height=',cheight,
                     aws_oracle_ext.htf$ifnotnull(cattributes,concat_ws('',' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


