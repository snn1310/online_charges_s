CREATE OR REPLACE FUNCTION aws_oracle_ext.next
(
    pcollection ANYARRAY,
    n INT
)
RETURNS INT AS
$BODY$  
    /*the function is depricated. collection_%METHOD_NAME% has to be used instead*/
    SELECT
        CASE
            WHEN COALESCE(ARRAY_LENGTH(pcollection, 1), 0) = 0 THEN
                NULL
            WHEN n >= ARRAY_LENGTH(pcollection, 1) THEN
                NULL
            WHEN n < 1 THEN
                1::INT
            ELSE 
                n + 1
        END;

$BODY$
IMMUTABLE
LANGUAGE SQL;