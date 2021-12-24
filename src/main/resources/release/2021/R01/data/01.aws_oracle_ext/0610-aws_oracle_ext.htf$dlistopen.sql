CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$dlistOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<dl',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear,'"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('',' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


