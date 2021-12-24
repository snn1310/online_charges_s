CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$paragraph
(
    calign       IN TEXT DEFAULT NULL,
    cnowrap      IN TEXT DEFAULT NULL,
    cclear       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<p',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' calign="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="', cnowrap, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


