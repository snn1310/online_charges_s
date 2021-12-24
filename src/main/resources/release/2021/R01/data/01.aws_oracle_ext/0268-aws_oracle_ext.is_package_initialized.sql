/*
 Checks a flag for the migrated package that it has already been initialized in the current session, 
 to prevent a re-execution for the initialization function.
 
 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package

 */
CREATE OR REPLACE FUNCTION aws_oracle_ext.is_package_initialized
(
    schema_name TEXT,
    package_name TEXT
)
RETURNS BOOLEAN
AS
$BODY$
BEGIN

    RETURN aws_oracle_ext.get_package_variable
    (
        schema_name => is_package_initialized.schema_name,
        package_name => is_package_initialized.package_name,
        variable_name => 'Init$$'
    )::BOOLEAN;

EXCEPTION
    WHEN OTHERS THEN

        RETURN FALSE;

END;
$BODY$
LANGUAGE plpgsql;
