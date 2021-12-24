CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formFile
(
    cname       IN TEXT,
    caccept     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="file"',
                     aws_oracle_ext.htf$ifnotnull(cname, concat_ws('', ' name="', cname, '"')),
                     aws_oracle_ext.htf$ifnotnull(caccept, concat_ws('', ' accept="', caccept, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


