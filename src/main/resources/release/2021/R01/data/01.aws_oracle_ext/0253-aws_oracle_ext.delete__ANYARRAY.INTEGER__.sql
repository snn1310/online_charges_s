CREATE OR REPLACE FUNCTION aws_oracle_ext.delete
(
    parray IN ANYARRAY,
    n IN INTEGER
)
RETURNS ANYARRAY
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    ind INTEGER;
BEGIN

/* DELETE(n) removes the nth element from collection */
    ind := ARRAY_LENGTH(parray, 1);

    RETURN
    CASE
        WHEN (n > ind) OR (n < 1) OR (n IS NULL) THEN
            parray
        ELSE
            ARRAY_APPEND(parray[1:n - 1], NULL)||parray[n + 1:ind]
    END;

END;
$BODY$;
