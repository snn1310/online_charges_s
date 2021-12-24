COMMENT ON FUNCTION aws_oracle_ext.is_package_initialized(TEXT, TEXT) IS $$
 Checks a flag for the migrated package that it has already been initialized in the current session, 
 to prevent a re-execution for the initialization function.
 
 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package
$$;