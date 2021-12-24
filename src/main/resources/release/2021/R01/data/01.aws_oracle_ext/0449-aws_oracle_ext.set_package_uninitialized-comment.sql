COMMENT ON FUNCTION aws_oracle_ext.set_package_initialized(TEXT, TEXT) IS $$
 Sets a flag for the migrated package in state uninitialized in the current session, 
 to a re-execution for the initialization function.
 
 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package
$$;