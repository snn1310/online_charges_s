/*
  Returns the object value in text representation form

  Parameters:
    schema_name  -- migrated schema
    package_name -- migrated package
    object_name  -- migrated object variable

  Returns:
    the object value in text representation form

  So, the reference to the whole object value of the UDT variable obj from the schema.package package is migrated to the next call:

    aws_oracle_ext.get_package_variable_object
      ( 'schema', 'package', 'obj' )::migrated_udt
  
*/

create or replace function aws_oracle_ext.get_package_variable_object
  ( schema_name name
  , package_name name
  , object_name name )
  returns text
 as
$$
  begin
    execute 'select ' || schema_name || '.' || package_name || '$Init()';

    return aws_oracle_ext.get_package_variable
        ( schema_name := schema_name
        , package_name := package_name
        , variable_name := object_name || '$OBJ' );
  end;
$$ language plpgsql;
