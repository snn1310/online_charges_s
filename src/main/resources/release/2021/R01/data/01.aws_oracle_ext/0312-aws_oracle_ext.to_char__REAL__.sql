CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN REAL
)
RETURNS VARCHAR
STRICT
AS
$BODY$
DECLARE
    vFmt     VARCHAR;
    vResult  VARCHAR DEFAULT NULL;
BEGIN

    IF pVal IS NOT NULL THEN

        vFmt := aws_oracle_ext.to_char_formatter
        (
            pVal      => pVal,
            pFormat   => '', -- not used
            pNoNumberFormat => '' -- value is just a flag
        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;

