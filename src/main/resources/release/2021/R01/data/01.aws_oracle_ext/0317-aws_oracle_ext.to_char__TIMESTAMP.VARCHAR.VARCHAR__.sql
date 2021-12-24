CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN TIMESTAMP,
    pFmt      IN VARCHAR,
    pNlsParam IN VARCHAR DEFAULT NULL
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    vResult VARCHAR DEFAULT NULL;
    vFmt VARCHAR;
BEGIN

    IF pVal IS NOT NULL THEN

        vFmt := aws_oracle_ext.to_char_formatter
        (
            pVal      => pVal,
            pFormat   => pFmt,
            pNlsParam => pNlsParam
        );

        vResult := TO_CHAR(pVal, vFmt);

    END IF;

    RETURN vResult;

END;
$BODY$;
