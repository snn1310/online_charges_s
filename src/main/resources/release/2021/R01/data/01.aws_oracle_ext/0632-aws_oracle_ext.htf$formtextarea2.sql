CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formTextarea2
(
    cname       IN TEXT,
    nrows       IN NUMERIC,
    ncolumns    IN NUMERIC,
    calign      IN TEXT DEFAULT NULL,
    cwrap       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<textarea name="',
                     cname,
                     '"',
                     ' rows="',
                     aws_oracle_ext.to_char(nrows),
                     '"',
                     ' cols="',
                     aws_oracle_ext.to_char(ncolumns),
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cwrap, concat_ws('', ' wrap="', cwrap, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '></textarea>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


