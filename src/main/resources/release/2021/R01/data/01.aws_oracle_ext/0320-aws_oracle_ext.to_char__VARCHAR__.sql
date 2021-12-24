CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal IN VARCHAR
)
RETURNS VARCHAR
STRICT
AS
$BODY$
DECLARE
    vResult VARCHAR DEFAULT NULL;
BEGIN

    IF pVal IS NOT NULL AND pVal <> '' THEN
    
        vResult := aws_oracle_ext.to_char_formatter
        (
            pVal => pVal
        );
    END IF;

    RETURN vResult;
    
END;
$BODY$
LANGUAGE plpgsql;

