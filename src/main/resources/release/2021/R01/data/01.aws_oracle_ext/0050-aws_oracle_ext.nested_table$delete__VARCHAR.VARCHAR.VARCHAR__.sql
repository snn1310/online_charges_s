CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$delete
(
    IN p_array_path VARCHAR,
    IN p_array_key VARCHAR,
    IN p_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
    SELECT aws_oracle_ext.collection_element_delete
    (
        p_routine_name => p_procedure_name,
        p_collection_path => p_array_path,
        p_start => p_array_key
    );
$BODY$
LANGUAGE SQL;