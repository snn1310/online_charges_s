CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$nextid
(
    cidentifier IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<nextid n="',
                     cidentifier,
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


