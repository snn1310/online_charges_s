CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$last
(
    IN p_array_path VARCHAR,
    IN p_procedure_name VARCHAR,
    IN p_def Anyelement DEFAULT NULL::TEXT
)
RETURNS ANYELEMENT
AS
$BODY$

    SELECT aws_oracle_ext.collection_last
    (
        p_routine_name => p_procedure_name,
        p_collection_path => p_array_path,
        p_tp => p_def
    );

$BODY$
LANGUAGE SQL;