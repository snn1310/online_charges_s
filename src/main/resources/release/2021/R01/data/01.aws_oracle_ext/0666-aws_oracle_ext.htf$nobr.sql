CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$nobr
(
    ctext IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<nobr>',
                     ctext,
                     '</nobr>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


