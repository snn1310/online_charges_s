CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$trim
(
    IN p_array_path VARCHAR,
    IN p_quantity_of_elements BIGINT,
    IN p_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
SELECT aws_oracle_ext.collection_element_trim
(
    p_routine_name => p_procedure_name,
    p_collection_path => p_array_path,
    p_n => p_quantity_of_elements
);
$BODY$
LANGUAGE SQL;

