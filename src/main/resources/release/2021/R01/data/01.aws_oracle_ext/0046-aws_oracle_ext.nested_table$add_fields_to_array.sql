CREATE OR REPLACE FUNCTION aws_oracle_ext.nested_table$add_fields_to_array
(
    IN p_array_id BIGINT,
    IN p_fields TEXT
)
RETURNS VOID
IMMUTABLE
AS
$BODY$
BEGIN
END;
$BODY$
LANGUAGE plpgsql;