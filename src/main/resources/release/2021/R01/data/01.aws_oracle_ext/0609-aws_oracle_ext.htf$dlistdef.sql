CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$dlistDef
(
    ctext       IN TEXT  DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('', '<dd',
                  aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="'||cclear||'"')),
                  aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                  '>',ctext);

$BODY$
LANGUAGE SQL
IMMUTABLE;


