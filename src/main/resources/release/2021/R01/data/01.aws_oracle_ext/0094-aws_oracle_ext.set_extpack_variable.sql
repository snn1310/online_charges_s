CREATE OR REPLACE FUNCTION aws_oracle_ext.set_extpack_variable
(
    IN variable_name TEXT,
    IN variable_value ANYELEMENT DEFAULT NULL::TEXT
)
RETURNS VOID
AS
$BODY$
SELECT aws_oracle_ext.set_package_variable
(
    variable_name => $1,
    variable_value => $2
);
$BODY$
LANGUAGE sql;