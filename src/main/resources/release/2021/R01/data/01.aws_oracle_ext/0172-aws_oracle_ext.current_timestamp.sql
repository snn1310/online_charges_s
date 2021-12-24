CREATE OR REPLACE FUNCTION aws_oracle_ext.current_timestamp
(
    p_precision INTEGER DEFAULT 6
)
RETURNS TIMESTAMP WITH TIME ZONE AS
$BODY$

    SELECT 
    CASE
    
        WHEN p_precision = 0 THEN CURRENT_TIMESTAMP(0)
        WHEN p_precision = 1 THEN CURRENT_TIMESTAMP(1)
        WHEN p_precision = 2 THEN CURRENT_TIMESTAMP(3)
        WHEN p_precision = 4 THEN CURRENT_TIMESTAMP(4)
        WHEN p_precision = 5 THEN CURRENT_TIMESTAMP(5)

        ELSE CURRENT_TIMESTAMP

    END;
        
    
$BODY$
STABLE
LANGUAGE SQL;
