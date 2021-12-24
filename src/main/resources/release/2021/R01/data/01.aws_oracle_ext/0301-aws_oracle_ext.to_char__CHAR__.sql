CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal IN CHAR
)
RETURNS VARCHAR AS
$BODY$
DECLARE
    vResult VARCHAR DEFAULT NULL;
    vargs TEXT;
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
