CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formImage
(
    cname       IN TEXT,
    csrc        IN TEXT,
    calign      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="image" name="',
                     cname,
                     '"',
                     ' src="',
                     csrc,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


