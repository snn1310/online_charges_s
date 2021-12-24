/*
 Sets a flag for the migrated package in state uninitialized in the current session, 
 to a re-execution for the initialization function.
 
 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package

 */
CREATE OR REPLACE FUNCTION aws_oracle_ext.set_package_uninitialized
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
        schema_name => set_package_uninitialized.schema_name,
        package_name => set_package_uninitialized.package_name,
        variable_name => 'Init$$',
        variable_value => FALSE
    );

END;
$BODY$
LANGUAGE plpgsql;
