CREATE OR REPLACE FUNCTION aws_oracle_ext.get_ora_sqlcode_by_pg(
     IN pg_code character varying)
RETURNS integer
AS
$BODY$
declare
    l_ora_code aws_oracle_ext.mapped_error_codes.ora_code%type;
  begin
    select ora_code into strict l_ora_code
      from aws_oracle_ext.mapped_error_codes c
     where c.pg_code = upper( get_ora_sqlcode_by_pg.pg_code )
       and ora_code is not null;

    return l_ora_code;
  exception
    when no_data_found then
      raise exception no_data_found 
      using message = format( 'No error code mapping is found for the PostgreSQL error code (%s)', pg_code )
          , detail =  concat_ws
              ('', 'There is no mapping found for the PostgreSQL error code in the current version of Extension Pack: ', pg_code )
          , hint = 'Check the documentation on error code mappings, please.'    ;
          
    when too_many_rows then
      raise exception too_many_rows 
      using message = format( 'More than one error code mapping is found for the PostgreSQL error code (%s)', pg_code )
          , detail =  concat_ws
              ('', 'More than one row found for the PostgreSQL error code in the current version of Extension Pack: ', pg_code )
          , hint = 'Check the documentation on error code mappings, please.'    ;
  end;
$BODY$
LANGUAGE  plpgsql;