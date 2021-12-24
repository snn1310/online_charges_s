CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$seed(IN p_seed TEXT)
RETURNS VOID
AS
$BODY$
DECLARE
    v_seedstr TEXT := substring(translate(upper(md5(p_seed)), 'ABCDEF', '123456'), 1, 15);
BEGIN
    PERFORM setseed(to_number(concat('0.', v_seedstr), '9.FM999999999999999999'));
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;
