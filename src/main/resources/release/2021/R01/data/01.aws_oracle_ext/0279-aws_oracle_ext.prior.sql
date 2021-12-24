CREATE OR REPLACE FUNCTION aws_oracle_ext.prior
(
    pcollection ANYARRAY,
    n INTEGER
)
RETURNS INTEGER AS
$body$  
    /*the function is depricated. collection_%METHOD_NAME% has to be used instead*/
    SELECT
        CASE
            WHEN n < 2 OR COALESCE(ARRAY_LENGTH(pcollection, 1), 0) = 0 THEN
                NULL
            WHEN n > ARRAY_LENGTH(pcollection, 1) THEN
                ARRAY_LENGTH(pcollection, 1)
            ELSE
                n - 1
        END;

$body$
IMMUTABLE
LANGUAGE SQL;