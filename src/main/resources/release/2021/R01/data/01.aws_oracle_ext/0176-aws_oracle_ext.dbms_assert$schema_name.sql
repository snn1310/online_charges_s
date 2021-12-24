CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$schema_name(IN p_schema_name TEXT)
RETURNS TEXT
AS
$BODY$
DECLARE
    v_schema_name VARCHAR;
BEGIN
    SELECT nspname
      INTO v_schema_name
      FROM pg_catalog.pg_namespace
     WHERE nspname = p_schema_name;

    IF (NOT FOUND) THEN
        RAISE invalid_schema_name;
    END IF;

    RETURN v_schema_name;
EXCEPTION
    WHEN invalid_schema_name THEN
        RAISE USING MESSAGE := 'Invalid schema.',
                    DETAIL := format('Checking found that schema with name %s does not exist in the database. Oracle error ORA-44001.',
                                     CASE
                                        WHEN p_schema_name IS NOT NULL THEN quote_literal(p_schema_name)
                                        ELSE concat(quote_literal('NULL'), ' (empty name)')
                                     END),
                    HINT := 'Verify that schema with such name have to be exist in the database or correct supplied schema name.';
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;

