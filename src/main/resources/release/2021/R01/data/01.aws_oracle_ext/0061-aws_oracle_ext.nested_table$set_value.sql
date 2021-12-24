CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$set_value
(
    IN p_array_path VARCHAR,
    IN p_procedure_name VARCHAR,
    IN p_value ANYELEMENT 
)
RETURNS VOID
AS
$BODY$

    SELECT aws_oracle_ext.collection_element_set
    (
        p_routine_name => p_procedure_name,
        p_collection_path => p_array_path,
        p_val => p_value
    );

$BODY$
LANGUAGE SQL;