CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$tableOpen
(
    cborder     IN TEXT DEFAULT NULL,
    calign      IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<table ',
                     aws_oracle_ext.htf$ifnotnull(cborder, concat_ws('', ' ', cborder)), 
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="nowrap"')),
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clearn="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


