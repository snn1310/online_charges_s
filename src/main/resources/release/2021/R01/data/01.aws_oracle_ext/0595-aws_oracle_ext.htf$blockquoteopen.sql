CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$blockquoteOpen
(
    cnowrap IN TEXT DEFAULT NULL,
    cclear       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<blockquote',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="nowrap"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


