CREATE OR REPLACE FUNCTION aws_oracle_ext.substr
(
    TEXT,
    NUMERIC
)
RETURNS TEXT
AS 
$$
    
    SELECT
        CASE
            WHEN ABS(TRUNC($2)::INTEGER) > LENGTH($1) THEN
                
                NULL::TEXT

            WHEN TRUNC($2)::INTEGER >= 0 THEN

                SUBSTR($1, CASE WHEN TRUNC($2)::INTEGER = 0 THEN 1 ELSE TRUNC($2)::INTEGER END)

            ELSE
                
                SUBSTR($1, LENGTH($1) + TRUNC($2)::INTEGER + 1)
        END;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;