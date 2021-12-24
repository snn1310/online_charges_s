CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$normal()
RETURNS DOUBLE PRECISION
AS
$BODY$
DECLARE
    v_u DOUBLE PRECISION;
    v_v DOUBLE PRECISION;
    v_s DOUBLE PRECISION;
BEGIN
    LOOP
        -- Range -1.0 <= u | v < 1.0
        v_u = random() * 2 - 1;
        v_v = random() * 2 - 1;
        v_s = power(v_u, 2) + power(v_v, 2);

        CONTINUE WHEN NOT (v_s != 0 AND v_s < 1);
        RETURN sqrt(-2 * ln(v_s) / v_s) * v_u;
    END LOOP;
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;


