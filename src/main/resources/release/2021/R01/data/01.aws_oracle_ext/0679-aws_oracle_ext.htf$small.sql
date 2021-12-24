CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$small
(
    IN ctext TEXT,
    IN cattributes TEXT DEFAULT NULL
)
RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('',
        '<SMALL',
        CASE
            WHEN cattributes IS NOT NULL THEN
                CONCAT_WS('', ' ', cattributes)
            ELSE
                ''
        END,
        '>',
        ctext,
        '</SMALL>'
    );

$BODY$
LANGUAGE SQL
IMMUTABLE;