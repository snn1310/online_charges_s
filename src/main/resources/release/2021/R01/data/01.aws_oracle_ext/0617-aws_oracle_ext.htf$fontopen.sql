CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$fontOpen
(
    ccolor     IN TEXT DEFAULT NULL,
    cface    IN TEXT DEFAULT NULL,
    csize    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<font',
                     aws_oracle_ext.htf$ifnotnull(ccolor, concat_ws('', ' color="', ccolor, '"')),
                     aws_oracle_ext.htf$ifnotnull(cface, concat_ws('', ' face="', cface, '"')),
                     aws_oracle_ext.htf$ifnotnull(csize, concat_ws('', ' size="', csize, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


