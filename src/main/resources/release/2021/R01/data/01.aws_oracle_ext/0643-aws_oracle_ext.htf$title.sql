CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$title
(
    IN ctitle TEXT
)
RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
                     '<TITLE>',
                     ctitle,
                     '</TITLE>'
                    );

$BODY$
LANGUAGE SQL
IMMUTABLE;