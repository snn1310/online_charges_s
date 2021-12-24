create or replace function aws_oracle_ext.has_column_privilege(schema_name name, table_name name, column_name name) 
returns boolean
 language plpgsql
 STRICT
AS $function$
begin
    return has_column_privilege(quote_ident($1 || '.'||$2), $3, 'SELECT,INSERT,UPDATE,REFERENCES');
    exception 
   		when others then return null;
end
$function$;
