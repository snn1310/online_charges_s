CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_cookie$send
(
    name     IN TEXT,
    value    IN TEXT,
    expires  IN TIMESTAMP  DEFAULT NULL,
    path     IN TEXT DEFAULT NULL,
    domain   IN TEXT DEFAULT NULL,
    secure   IN TEXT DEFAULT NULL,
    httponly IN TEXT DEFAULT NULL
)
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$print
    (
        CONCAT
        (
            'Set-Cookie: ',
            name,
            '=',
            value,
            ';',
            CASE
                WHEN expires IS NOT NULL THEN
                    CONCAT(' expires=', aws_oracle_ext.to_char(expires, 'DD-Mon-YYYY HH24:MI:SS', 'NLS_DATE_LANGUAGE=en_US'), ';')
                ELSE
                    ''
            END,
            CASE
                WHEN path IS NOT NULL THEN
                    CONCAT(' path=', path, ';')
                ELSE
                    ''
            END,
            CASE
                WHEN domain IS NOT NULL THEN
                    CONCAT(' domain=', domain, ';')
                ELSE
                    ''
            END,
            CASE
                WHEN secure IS NOT NULL THEN
                    ' secure;'
                ELSE
                    ''
            END,
            CASE
                WHEN httponly IS NOT NULL THEN
                    ' HttpOnly'
                ELSE
                    ''
            END
        )
    );

END;
$BODY$
LANGUAGE plpgsql;