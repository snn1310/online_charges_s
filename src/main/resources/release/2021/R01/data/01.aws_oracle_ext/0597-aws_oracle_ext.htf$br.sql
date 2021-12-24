CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$br
(
    IN cclear TEXT DEFAULT NULL,
    IN cattributes TEXT DEFAULT NULL
)
RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<br',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;