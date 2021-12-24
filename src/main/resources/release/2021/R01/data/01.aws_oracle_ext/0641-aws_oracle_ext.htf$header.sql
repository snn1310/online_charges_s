CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$header
(
    nsize   IN NUMERIC,
    cheader IN TEXT,
    calign  IN TEXT DEFAULT NULL,
    cnowrap IN TEXT DEFAULT NULL,
    cclear  IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<',
                     'h',
                     aws_oracle_ext.to_char(least(abs(nsize),6)),
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="nowrap"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     cheader,
                     '</',
                     'h',
                     aws_oracle_ext.to_char(least(abs(nsize),6)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


