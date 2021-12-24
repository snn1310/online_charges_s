/*
 Stores the value of field of the global package object variable as a session setting

 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package
  variable_name -- migrated global variable or constant
  field_name -- a name of field in dot-delimited notation. 
  field_value -- new value of any type, will be migrated to text automatically
                So, the assignment to the var.parent_field.child_field from the schema.package 
		package is migrated to the next call:

                  perform aws_oracle_ext.set_package_variable_object_field
                    ( 'schema', 'package', 'var', 'parent_field.child_field', variable_value );
*/
create or replace function aws_oracle_ext.set_package_variable_object_field
  ( schema_name name
  , package_name name
  , variable_name name
  , field_name text
  , field_value anyelement )
  returns void
as
$BODY$
  begin
    perform aws_oracle_ext.set_package_variable
      ( schema_name, package_name, variable_name || '.' || field_name, field_value );
  end;
$BODY$ language plpgsql;
