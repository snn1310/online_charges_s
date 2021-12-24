CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN DOUBLE PRECISION,
    pFmt      IN VARCHAR,
    pNlsParam IN VARCHAR DEFAULT NULL
)
RETURNS VARCHAR AS
$BODY$
DECLARE
    vFmt     VARCHAR;
    vResult  VARCHAR DEFAULT NULL;
BEGIN

    IF pVal IS NOT NULL THEN

        vFmt := aws_oracle_ext.to_char_formatter
        (
            pVal      => pVal,
            pFormat   => pFmt,
            pNlsParam => pNlsParam
        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;
