CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formopen
(
    curl        IN TEXT,
    cmethod     IN TEXT DEFAULT 'POST',
    ctarget     IN TEXT DEFAULT NULL,
    cenctype    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)
RETURNS TEXT AS
$BODY$
    SELECT CONCAT_WS('',
        '<FORM ACTION="',
        curl,
        '" METHOD="',
        cmethod,
        '"',
        CASE
            WHEN ctarget IS NOT NULL THEN
                CONCAT_WS('', ' TARGET="', ctarget, '"')
            ELSE
                ''
        END,
        CASE
            WHEN cenctype IS NOT NULL THEN
                CONCAT_WS('', ' ENCTYPE="', cenctype, '"')
            ELSE
                ''
        END,
        CASE
            WHEN cattributes IS NOT NULL THEN
                CONCAT_WS('', ' ', cattributes)
            ELSE
                ''
        END,
        '>'
    );

$BODY$
LANGUAGE SQL
IMMUTABLE;