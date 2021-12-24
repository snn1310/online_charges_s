CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$count
(
    IN p_array_path VARCHAR,
    IN p_procedure_name VARCHAR
)
RETURNS BIGINT
AS
$BODY$
    SELECT aws_oracle_ext.collection_count
    (
        p_routine_name => p_procedure_name,
        p_collection_path => p_array_path
    );
$BODY$
LANGUAGE SQL;
