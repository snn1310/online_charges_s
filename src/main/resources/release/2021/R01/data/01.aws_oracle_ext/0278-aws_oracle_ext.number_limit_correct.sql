CREATE OR REPLACE FUNCTION aws_oracle_ext.number_limit_correct
(
    pVal IN NUMERIC
)
RETURNS NUMERIC
LANGUAGE plpgsql
IMMUTABLE
STRICT
PARALLEL SAFE
AS
$BODY$
BEGIN

    IF pVal < -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    OR pVal > 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    THEN

        RAISE USING MESSAGE := 'ORA-01426: numeric overflow', HINT := '-01426';

    END IF;

    RETURN pVal;
    
END;
$BODY$;
