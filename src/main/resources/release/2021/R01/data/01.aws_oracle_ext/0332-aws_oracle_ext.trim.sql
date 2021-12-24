CREATE OR REPLACE FUNCTION aws_oracle_ext.trim
(
    parray IN ANYARRAY,
    pn IN NUMERIC DEFAULT NULL
)
RETURNS ANYARRAY
AS
$trim$
DECLARE
    
    vN INTEGER;
    vLength INTEGER;
BEGIN

    vLength := ARRAY_LENGTH(parray, 1);
    
    IF pn IS NULL THEN

        vN := 1;

    ELSE

        vN := ROUND(pn)::INTEGER;

    END IF;

    IF vN < 0 THEN 
    
        RAISE EXCEPTION USING MESSAGE := 'ORA-06502: PL/SQL: numeric or value error';

    END IF;
    
    IF vN > vLength THEN
    
        RAISE EXCEPTION USING MESSAGE := 'ORA-06533: Subscript beyond count';

    END IF;

    RETURN parray[1:vLength - vN];

END;
$trim$
LANGUAGE plpgsql;
