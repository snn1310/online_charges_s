CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$tableRowOpen
(
    calign      IN TEXT DEFAULT NULL,
    cvalign     IN TEXT DEFAULT NULL,
    cdp         IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<tr',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cvalign, concat_ws('', ' valign="', cvalign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cdp, concat_ws('', ' dp="', cdp, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="nowrap"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>');
 
$BODY$
LANGUAGE SQL
IMMUTABLE;


