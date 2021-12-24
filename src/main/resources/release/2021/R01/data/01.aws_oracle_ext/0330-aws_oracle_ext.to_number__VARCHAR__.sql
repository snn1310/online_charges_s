CREATE OR REPLACE FUNCTION aws_oracle_ext.to_number
(
    pVal IN VARCHAR
)
RETURNS NUMERIC
STRICT
AS
$BODY$
DECLARE
    vResult NUMERIC DEFAULT NULL;
BEGIN

    IF pVal IS NOT NULL AND pVal <> '' THEN

        vResult := aws_oracle_ext.to_number_formatter
        (
            pVal => pVal,
            pNoNumberFormat => 'Y'
        );

    END IF;

    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;



