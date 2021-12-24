CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$tableData
(
    cvalue      IN TEXT  DEFAULT NULL,
    calign      IN TEXT DEFAULT NULL,
    cdp         IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    crowspan    IN TEXT DEFAULT NULL,
    ccolspan    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<td',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="', calign, '"')),
                     aws_oracle_ext.htf$ifnotnull(cdp, concat_ws('', ' dp="', cdp, '"')),
                     aws_oracle_ext.htf$ifnotnull(crowspan, concat_ws('', ' rowspan="', crowspan, '"')),
                     aws_oracle_ext.htf$ifnotnull(ccolspan, concat_ws('', ' colspan="', ccolspan, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnowrap, concat_ws('', ' nowrap="nowrap"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '>',
                     cvalue,
                     '</td>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


