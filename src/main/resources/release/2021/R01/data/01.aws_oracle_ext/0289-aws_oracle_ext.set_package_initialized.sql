/*
 Sets a flag for the migrated package that it has already been initialized in the current session, 
 to prevent a re-execution for the initialization function.
 
 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package

 */
CREATE OR REPLACE FUNCTION aws_oracle_ext.set_package_initialized
(
    schema_name TEXT,
    package_name TEXT
)
RETURNS VOID
AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.set_package_variable
    (
        schema_name => set_package_initialized.schema_name,
        package_name => set_package_initialized.package_name,
        variable_name => 'Init$$',
        variable_value => TRUE
    );

END;
$BODY$
LANGUAGE plpgsql;
