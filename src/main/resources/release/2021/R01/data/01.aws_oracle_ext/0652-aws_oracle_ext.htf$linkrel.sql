CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$linkRel
(
    crel   IN TEXT,
    curl   IN TEXT,
    ctitle IN TEXT  DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<link rel="',
                     crel,
                     '"',
                     ' href="',
                     curl,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(ctitle, concat_ws('', ' title="',ctitle,'"')),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


