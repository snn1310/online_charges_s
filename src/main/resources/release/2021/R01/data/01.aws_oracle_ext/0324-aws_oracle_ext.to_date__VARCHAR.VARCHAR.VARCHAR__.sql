CREATE OR REPLACE FUNCTION aws_oracle_ext.to_date
(
    pVal      IN VARCHAR,
    pFmt      IN VARCHAR,
    pNlsParam IN VARCHAR DEFAULT NULL
)
RETURNS TIMESTAMP
LANGUAGE plpgsql
AS
$BODY$
DECLARE

    vResult TIMESTAMP DEFAULT NULL;
    vFmt VARCHAR;
    vValFormatted VARCHAR;

BEGIN

    IF pVal IS NOT NULL AND pVal <> '' THEN
        
        IF pNlsParam IS NULL THEN

            SELECT f.dmodelto
            INTO vFmt
            FROM aws_oracle_data.tdfmt f
            WHERE f.dmodel = pFmt;

            IF FOUND THEN

                RETURN TO_TIMESTAMP(pVal, vFmt)::TIMESTAMP(0);

            END IF;

        END IF;
        
        SELECT vval,
            format
        INTO vValFormatted,
            vFmt
        FROM aws_oracle_ext.to_date_formatter
        (
            pVal      => pVal,
            pFormat   => pFmt,
            pNlsParam => pNlsParam
        );

        vResult := TO_TIMESTAMP(vValFormatted, vFmt);

    END IF;

    RETURN vResult::TIMESTAMP(0);

END;
$BODY$;

