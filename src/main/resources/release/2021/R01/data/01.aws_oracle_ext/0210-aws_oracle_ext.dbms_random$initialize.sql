CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$initialize(IN p_seed NUMERIC)
RETURNS VOID
AS
$BODY$
BEGIN
    PERFORM aws_oracle_ext.dbms_random$seed(p_seed);
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;

