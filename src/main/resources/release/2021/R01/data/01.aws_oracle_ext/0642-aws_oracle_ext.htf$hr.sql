CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$hr
(
    cclear      IN TEXT DEFAULT NULL,
    csrc        IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<hr',
                     aws_oracle_ext.htf$ifnotnull(cclear, concat_ws('', ' clear="', cclear, '"')),
                     aws_oracle_ext.htf$ifnotnull(csrc, concat_ws('', ' src="', csrc, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '/>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


