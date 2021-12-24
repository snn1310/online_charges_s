CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$style
(
    cstyle IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<style>',
                     cstyle,
                     '</style>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


