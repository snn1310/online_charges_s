CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$address
(
    cvalue       IN TEXT,
    cnowrap      IN TEXT DEFAULT NULL,
    cclear       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<address',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', 'clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap,' nowrap="nowrap"'),
                     aws_oracle_ext.htf$ifnotnull(cattributes,concat_ws('', ' ', cattributes)),
                     '>',
                     cvalue,
                     '</address>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


