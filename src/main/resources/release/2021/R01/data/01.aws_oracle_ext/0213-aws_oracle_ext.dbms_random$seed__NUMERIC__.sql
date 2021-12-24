CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$seed(IN p_seed NUMERIC)
RETURNS VOID
AS
$BODY$
DECLARE
    v_seedsign INTEGER := sign(p_seed);
    v_seedstr VARCHAR := rpad(to_char(abs(p_seed), 'FM9999999999'), 15, '0');
BEGIN
    PERFORM setseed(to_number(concat('0.', v_seedstr), '9.FM999999999999999999') * v_seedsign);
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;
