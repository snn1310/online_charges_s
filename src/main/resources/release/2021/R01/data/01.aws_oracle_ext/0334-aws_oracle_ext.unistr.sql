CREATE OR REPLACE FUNCTION aws_oracle_ext.unistr(p IN TEXT)
RETURNS TEXT
IMMUTABLE
STRICT
AS
$BODY$
DECLARE
    res TEXT;
BEGIN

    EXECUTE CONCAT
    (
        $$SELECT E'$$,
        REPLACE(REPLACE(REPLACE(p,'\\','zZzZ'),'\','\u'),'zZzZ','\\'),
        $$'$$
    ) INTO RES;

    RETURN RES;

END;
$BODY$
LANGUAGE plpgsql;