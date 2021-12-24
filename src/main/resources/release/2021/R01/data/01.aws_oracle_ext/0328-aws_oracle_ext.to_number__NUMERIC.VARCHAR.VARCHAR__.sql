CREATE OR REPLACE FUNCTION aws_oracle_ext.to_number
(
    pVal       IN NUMERIC,
    pFormat    IN VARCHAR,
    pNlsParam  IN VARCHAR DEFAULT NULL
)
RETURNS NUMERIC
AS
$BODY$
DECLARE
    vResult NUMERIC DEFAULT NULL;
    vFormat VARCHAR;
BEGIN

    IF pVal IS NOT NULL THEN

        IF pNlsParam IS NULL THEN

            SELECT f.nmodel
            INTO vFormat
            FROM aws_oracle_data.tnfmt f
            WHERE f.nmodel = pFormat;

            IF FOUND THEN

                 RETURN TO_NUMBER(aws_oracle_ext.number_limit_correct(pVal), vFormat);

            END IF;

        END IF;

        vResult := aws_oracle_ext.to_number_formatter
        (
            pVal      => pVal,
            pFormat   => pFormat,
            pNlsParam => pNlsParam
        );

    END IF;
    
    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;
