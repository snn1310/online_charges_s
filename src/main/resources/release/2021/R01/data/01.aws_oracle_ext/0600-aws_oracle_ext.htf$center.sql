CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$center
(
    ctext IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<center>',
                     ctext,
                     '</center>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


