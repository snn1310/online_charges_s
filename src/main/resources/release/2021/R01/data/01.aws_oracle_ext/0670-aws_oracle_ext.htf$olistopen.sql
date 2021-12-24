CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$olistOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cwrap       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<ol',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cwrap, concat_ws('', ' wrap="', cwrap, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');
                     
$BODY$
LANGUAGE SQL
IMMUTABLE;


