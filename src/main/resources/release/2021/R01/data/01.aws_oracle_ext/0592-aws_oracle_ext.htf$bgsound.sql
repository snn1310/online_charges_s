CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$bgsound
(
    csrc        IN TEXT,
    cloop       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<bgsound src="',
                     csrc,
                     '"',
                     aws_oracle_ext.htf$IFNOTNULL(cloop, concat_ws('', ' loop="', cloop, '"')),
                     aws_oracle_ext.htf$IFNOTNULL(cattributes, concat_ws('',' ', cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


