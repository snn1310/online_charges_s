CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal IN TIMESTAMP
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    vFmt VARCHAR;
BEGIN

    IF SUBSTRING(TO_CHAR(EXTRACT('epoch' FROM pVal), '9999999999D9999999'),12,6) = '.00000' THEN

        SELECT value
        INTO vFmt
        FROM aws_oracle_ext.v$nls_parameters
        WHERE parameter = 'NLS_DATE_FORMAT';

    ELSE

        SELECT value
        INTO vFmt
        FROM aws_oracle_ext.v$nls_parameters
        WHERE parameter = 'NLS_TIMESTAMP_FORMAT';

    END IF;

    RETURN aws_oracle_ext.to_char
    (
        pVal => pVal,
        pFmt => vFmt
    );

END;
$BODY$;
