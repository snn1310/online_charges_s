/*
  Saves the value of migrated global object variable in text representation form
  as a session setting

  Parameters:
    schema_name  -- migrated schema
    package_name -- migrated package
    object_name  -- migrated object variable
    object_value -- value of any type

  So, the assignment of object_value value to the obj object variable from the schema.package package is migrated to the next call:

    perform aws_oracle_ext.set_package_variable_object
      ( 'schema', 'package', 'obj', object_value );
  
*/
create or replace function aws_oracle_ext.set_package_variable_object
  ( schema_name name
  , package_name name
  , object_name name
  , object_value anyelement )
  returns void
as
$BODY$  
  begin
    perform aws_oracle_ext.set_package_variable
      ( schema_name := schema_name
      , package_name := package_name
      , variable_name := object_name || '$OBJ'
      , variable_value := object_value::text );

    perform aws_oracle_ext.set_package_variable
      ( schema_name := schema_name
      , package_name := package_name
      , variable_name := object_name || '$TYPE'
      , variable_value := pg_typeof( object_value ) );
  end;
$BODY$ language plpgsql;
