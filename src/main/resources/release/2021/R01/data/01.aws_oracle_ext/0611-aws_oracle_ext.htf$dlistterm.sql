CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$dlistTerm
(
    ctext       IN TEXT  DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<dt',
                     aws_oracle_ext.htf$IFNOTNULL(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$IFNOTNULL(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     ctext);

$BODY$
LANGUAGE SQL
IMMUTABLE;


