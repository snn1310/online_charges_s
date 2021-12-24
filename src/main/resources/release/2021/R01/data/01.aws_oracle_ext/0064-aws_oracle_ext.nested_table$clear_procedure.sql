CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$clear_procedure
(
    IN p_procedure_name VARCHAR
)
RETURNS VOID
AS
$BODY$
    SELECT aws_oracle_ext.collections_delete_by_routine
    (
        p_routine_name => p_procedure_name
    );
$BODY$
LANGUAGE SQL;