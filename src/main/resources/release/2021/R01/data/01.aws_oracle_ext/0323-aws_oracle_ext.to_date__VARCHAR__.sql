CREATE OR REPLACE FUNCTION aws_oracle_ext.to_date
(
    pVal IN VARCHAR
)
RETURNS TIMESTAMP
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    vResult TIMESTAMP DEFAULT NULL;
    vFmt VARCHAR;
BEGIN
    
    SELECT value
    INTO vFmt
    FROM aws_oracle_ext.v$nls_parameters
    WHERE parameter = 'NLS_DATE_FORMAT';

    vResult := aws_oracle_ext.to_date
    (
        pVal => pVal,
        pFmt => vFmt
    );

    RETURN vResult::TIMESTAMP(0);

END;
$BODY$;


