CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal IN TIMESTAMP WITH TIME ZONE
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    vFmt VARCHAR;
BEGIN

    SELECT value
    INTO vFmt
    FROM aws_oracle_ext.v$nls_parameters
    WHERE parameter = 'NLS_TIMESTAMP_TZ_FORMAT';

    RETURN aws_oracle_ext.to_char
    (
        pVal => pVal,
        pFmt => vFmt
    );
    
END;
$BODY$;


