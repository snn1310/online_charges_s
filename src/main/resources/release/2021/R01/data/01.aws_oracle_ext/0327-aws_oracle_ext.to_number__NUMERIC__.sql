CREATE OR REPLACE FUNCTION aws_oracle_ext.to_number
(
    pVal IN NUMERIC
)
RETURNS NUMERIC
STRICT
AS
$BODY$
BEGIN

    RETURN aws_oracle_ext.number_limit_correct(pVal);

END;
$BODY$
LANGUAGE plpgsql;
