CREATE OR REPLACE FUNCTION aws_oracle_ext.substrb
(
    TEXT,
    NUMERIC,
    NUMERIC
)
RETURNS TEXT
AS 
$$
    
    SELECT
        CASE
            WHEN TRUNC($3)::INTEGER <= 0 THEN

                NULL::TEXT

            WHEN ABS(TRUNC($2)::INTEGER) > OCTET_LENGTH($1) THEN
                
                NULL::TEXT

            WHEN TRUNC($2)::INTEGER >= 0 THEN
                
                CONVERT_FROM(SUBSTR($1::BYTEA, CASE WHEN TRUNC($2)::INTEGER = 0 THEN 1 ELSE TRUNC($2)::INTEGER END, TRUNC($3)::INTEGER),'UTF8')

            ELSE
                
                CONVERT_FROM(SUBSTR($1::BYTEA, OCTET_LENGTH($1) + TRUNC($2)::INTEGER + 1, TRUNC($3)::INTEGER),'UTF8')
        END;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;