CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$preOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cwidth      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('', 
                     '<pre',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cwidth, concat_ws('', ' width="', cwidth, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),  
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


