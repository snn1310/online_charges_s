CREATE OR REPLACE FUNCTION aws_oracle_ext.array$next
(
    IN p_array_path VARCHAR,
    IN p_array_key VARCHAR,
    IN p_procedure_name VARCHAR,
    IN p_def Anyelement DEFAULT NULL::TEXT
)
RETURNS ANYELEMENT
AS
$BODY$

    SELECT aws_oracle_ext.collection_next
	(
		p_routine_name => p_procedure_name,
        p_collection_path => p_array_path,
        p_idx => p_array_key,
        p_tp => p_def
	);

$BODY$
LANGUAGE SQL;

