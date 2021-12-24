CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formSelectOpen
(
    cname       IN TEXT,
    cprompt     IN TEXT  DEFAULT NULL,
    nsize       IN NUMERIC  DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     cprompt,
                     '<select name="',
                     cname,
                     aws_oracle_ext.htf$ifnotnull(aws_oracle_ext.to_char(nsize), concat_ws('', ' size="', nsize, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


