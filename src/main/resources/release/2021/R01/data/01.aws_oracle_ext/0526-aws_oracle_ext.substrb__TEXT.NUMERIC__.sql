CREATE OR REPLACE FUNCTION aws_oracle_ext.substrb
(
    TEXT,
    NUMERIC
)
RETURNS TEXT
AS 
$$
    
    SELECT
        CASE
            WHEN ABS(TRUNC($2)::INTEGER) > OCTET_LENGTH($1) THEN
                
                NULL::TEXT

            WHEN TRUNC($2)::INTEGER >= 0 THEN

                CONVERT_FROM(SUBSTR($1::BYTEA, CASE WHEN TRUNC($2)::INTEGER = 0 THEN 1 ELSE TRUNC($2)::INTEGER END),'UTF8')

            ELSE
                
                CONVERT_FROM(SUBSTR($1::BYTEA, OCTET_LENGTH($1) + TRUNC($2)::INTEGER + 1),'UTF8')
        END;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
