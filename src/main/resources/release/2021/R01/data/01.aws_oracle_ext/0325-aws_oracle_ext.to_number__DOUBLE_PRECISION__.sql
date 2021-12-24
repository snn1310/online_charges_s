CREATE OR REPLACE FUNCTION aws_oracle_ext.to_number
(
    pVal IN DOUBLE PRECISION
)
RETURNS NUMERIC
STRICT
AS
$BODY$
BEGIN

    RETURN aws_oracle_ext.number_limit_correct(pVal::NUMERIC);

END;
$BODY$
LANGUAGE plpgsql;


