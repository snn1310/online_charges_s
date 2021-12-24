CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$escape_sc
(
    ctext IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT replace(
             replace(
             replace(
             replace(ctext, '&', concat_ws('', '&', 'amp;')),
                            '"', concat_ws('', '&', 'quot;')),
                            '<', concat_ws('', '&', 'lt;')),
                            '>', concat_ws('', '&', 'gt;'));

$BODY$
LANGUAGE SQL
IMMUTABLE;


