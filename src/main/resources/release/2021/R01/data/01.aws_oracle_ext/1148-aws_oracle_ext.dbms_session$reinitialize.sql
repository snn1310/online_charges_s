CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$reinitialize
()
RETURNS INTEGER
AS
$BODY$

    SELECT 2::INTEGER;

$BODY$
LANGUAGE SQL
IMMUTABLE;


