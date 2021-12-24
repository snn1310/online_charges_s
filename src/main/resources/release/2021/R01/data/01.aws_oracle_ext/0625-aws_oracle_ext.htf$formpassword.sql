CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formpassword
(
    cname        IN TEXT,
    csize        IN TEXT,
    cmaxlength   IN TEXT   DEFAULT NULL,
    cvalue       IN TEXT   DEFAULT NULL,
    cattributes  IN TEXT   DEFAULT NULL
)
RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('', 
        '<INPUT TYPE="password" NAME="',
        cname,
        '" SIZE="',
        csize,
        CASE
            WHEN cmaxlength IS NOT NULL THEN
                CONCAT_WS('', '" MAXLENGTH="', cmaxlength, '"')
            ELSE
                ''
        END,
        CASE
            WHEN cvalue IS NOT NULL THEN
                CONCAT_WS('', ' VALUE="', cvalue, '"')
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