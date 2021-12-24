/* =============== aws_oracle_ext.dbms_utility$current_instance =============== */
CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_utility$current_instance()
RETURNS INTEGER
AS $$
SELECT 1
$$
IMMUTABLE
LANGUAGE SQL;

COMMENT ON FUNCTION aws_oracle_ext.dbms_utility$current_instance()
IS
'This function returns the current connected instance number.';