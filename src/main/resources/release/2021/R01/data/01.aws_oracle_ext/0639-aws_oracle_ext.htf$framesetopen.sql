CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$framesetOpen
(
    crows    IN TEXT DEFAULT NULL,
    ccols     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<frameset',
                     aws_oracle_ext.htf$ifnotnull(crows, concat_ws('', ' rows="', crows, '"')),
                     aws_oracle_ext.htf$ifnotnull(ccols, concat_ws('', ' cols="', ccols, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


