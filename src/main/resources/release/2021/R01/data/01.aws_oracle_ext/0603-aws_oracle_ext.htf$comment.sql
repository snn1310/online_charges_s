CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$comment
(
    IN ctext TEXT
)
RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<!-- ',
                     ctext,
                     ' --');

$BODY$
LANGUAGE SQL
IMMUTABLE;