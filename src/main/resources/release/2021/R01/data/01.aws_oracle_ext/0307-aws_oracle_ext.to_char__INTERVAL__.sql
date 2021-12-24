CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN INTERVAL
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$BODY$
BEGIN

    RETURN aws_oracle_ext.to_char
    (
        pVal => pVal,
        pFmt => 'd' -- won't be used, just to pass something correct
    );
    
END;
$BODY$;

