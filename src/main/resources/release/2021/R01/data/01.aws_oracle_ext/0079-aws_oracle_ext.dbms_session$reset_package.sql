CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_session$reset_package
()
RETURNS VOID
AS
$BODY$
SELECT aws_oracle_ext.dbms_session$modify_package_state(1::INTEGER);
$BODY$
LANGUAGE SQL;