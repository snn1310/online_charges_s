CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal IN DATE
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
    WHERE parameter = 'NLS_DATE_FORMAT';

    RETURN aws_oracle_ext.to_char
    (
        pVal => pVal::TIMESTAMP(0),
        pFmt => vFmt
    );

END;
$BODY$;
