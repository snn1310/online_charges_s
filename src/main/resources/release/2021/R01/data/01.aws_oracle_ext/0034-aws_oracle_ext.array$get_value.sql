CREATE OR REPLACE FUNCTION aws_oracle_ext.array$get_value
(
    IN p_array_value_path VARCHAR,
    IN p_procedure_name VARCHAR,
    IN p_value_datatype ANYELEMENT DEFAULT NULL::TEXT
)
RETURNS ANYELEMENT
AS
$BODY$
DECLARE
    vret JSONB;
BEGIN

    vret := aws_oracle_ext.collection_element_get
	(
		p_routine_name => p_procedure_name,
        p_collection_path => p_array_value_path
	);

    IF vret IS NULL THEN

        RAISE NO_DATA_FOUND;

    END IF;

    RETURN JSONB_POPULATE_RECORD
    (
        p_value_datatype,
        vret
    );

END;
$BODY$
LANGUAGE plpgsql;