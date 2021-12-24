CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$value(IN p_start DOUBLE PRECISION DEFAULT 0,
                                                            IN p_high DOUBLE PRECISION DEFAULT 1)
RETURNS DOUBLE PRECISION
AS
$BODY$
BEGIN
    RETURN random() * (p_high - p_start) + p_start;
END;
$BODY$
LANGUAGE plpgsql
VOLATILE
RETURNS NULL ON NULL INPUT;

