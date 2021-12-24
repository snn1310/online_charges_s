CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$script
(
    cscript IN TEXT,
    clanguage IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<script'||
                     aws_oracle_ext.htf$ifnotnull(clanguage, concat_ws('', ' language="', clanguage, '"')),
                     '>',
                     cscript,
                     '</script>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


