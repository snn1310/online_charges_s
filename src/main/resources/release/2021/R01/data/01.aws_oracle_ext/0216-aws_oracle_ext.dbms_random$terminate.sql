CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_random$terminate()
RETURNS VOID
AS
$BODY$
BEGIN
    PERFORM setseed(random());
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;


