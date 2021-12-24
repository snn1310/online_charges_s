CREATE OR REPLACE FUNCTION aws_oracle_ext.extend
(
    parray IN ANYARRAY,
    n IN INTEGER DEFAULT 1,
    ii IN INTEGER DEFAULT NULL
)
RETURNS ANYARRAY
AS
$BODY$
BEGIN

    FOR idx IN 1..n LOOP

      parray := ARRAY_APPEND(parray, parray[ii]);

    END LOOP;

    RETURN parray;

END;
$BODY$
LANGUAGE 'plpgsql';