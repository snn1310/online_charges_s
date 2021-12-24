CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$extend
(
    IN p_array_path VARCHAR,
    IN p_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
SELECT aws_oracle_ext.nested_table$extend
(
    p_array_path,
    NULL,
    NULL,
    p_procedure_name
);
$BODY$
LANGUAGE SQL;