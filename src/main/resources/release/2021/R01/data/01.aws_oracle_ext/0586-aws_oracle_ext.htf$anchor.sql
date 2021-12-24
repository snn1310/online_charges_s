CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$anchor
(
   curl        IN TEXT,
   ctext       IN TEXT,
   cname       IN TEXT   DEFAULT NULL,
   cattributes IN TEXT   DEFAULT NULL
)
RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('', 
        '<A HREF="',
        curl,
        '"',
        CASE
            WHEN cname IS NOT NULL THEN
                CONCAT_WS('', ' NAME="', cname, '"')
            ELSE
                ''
        END,
        CASE
            WHEN cattributes IS NOT NULL THEN
                CONCAT_WS('', ' ', cattributes)
            ELSE
                ''
        END,
        '>',
        ctext,
        '</A>'
    );

$BODY$
LANGUAGE SQL
IMMUTABLE;