CREATE OR REPLACE FUNCTION aws_oracle_ext.delete
(
    parray IN ANYARRAY,
    m IN INTEGER,
    n IN INTEGER
)
RETURNS ANYARRAY
LANGUAGE plpgsql
AS
$BODY$  
DECLARE
    ind INTEGER;
    vArray parray%type;
BEGIN
/* DELETE(m,n) removes all elements in the range m..n from collection */

    IF (m > n) OR (n IS NULL) OR (m iS NULL) THEN

        vArray := parray;

    ELSE

        ind := ARRAY_LENGTH(parray, 1);
        vArray := parray[1:m - 1];

        FOR i IN 1..n - m + 1 LOOP

            vArray := ARRAY_APPEND(vArray, NULL);

        END LOOP;

        vArray := vArray || parray[n + 1:ind];

    END IF;

    RETURN vArray;

END;
$BODY$;
