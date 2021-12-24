/*
 Returns the value of field of the global package object variable from the session setting

 Parameters:
  schema_name -- migrated schema
  package_name -- migrated package
  variable_name -- migrated global variable or constant
  field_name -- a name of object field in dot-delimited notation. 
                So, a reference to the var.parent_field.child_field from the schema.package 
		package is migrated to the next call:

                  aws_oracle_ext.get_package_variable_object_field
                    ( 'schema', 'package', 'var', 'parent_field.child_field' )::migrated_udt

 Result:
   text representation of the field value, should be converted explicitly back to its initial type
*/
create or replace function aws_oracle_ext.get_package_variable_object_field
  ( schema_name name
  , package_name name
  , variable_name name
  , field_name text )
returns text
as
$BODY$
  begin
    execute 'select ' || schema_name || '.' || package_name || '$Init()';

    return aws_oracle_ext.get_package_variable
      ( schema_name, package_name, variable_name || '.' || field_name );
  end;
$BODY$ language plpgsql;
