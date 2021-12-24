CREATE OR REPLACE FUNCTION aws_oracle_ext.localtimestamp
(
    p_precision INTEGER DEFAULT 6
)
RETURNS TIMESTAMP WITHOUT TIME ZONE AS
$BODY$

    SELECT 
    CASE
    
        WHEN p_precision = 0 THEN LOCALTIMESTAMP(0)
        WHEN p_precision = 1 THEN LOCALTIMESTAMP(1)
        WHEN p_precision = 2 THEN LOCALTIMESTAMP(3)
        WHEN p_precision = 4 THEN LOCALTIMESTAMP(4)
        WHEN p_precision = 5 THEN LOCALTIMESTAMP(5)

        ELSE LOCALTIMESTAMP

    END;
    
$BODY$
STABLE
LANGUAGE SQL;
