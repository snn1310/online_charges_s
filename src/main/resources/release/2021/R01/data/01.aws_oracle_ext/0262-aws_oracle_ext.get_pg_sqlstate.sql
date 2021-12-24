/*
  Returns a mapped PostgreSQL error code for Oracle error code, if a mapping exists.

  Parameters:
    ora_code -- Oracle integer error code like those SQLCODE returns
*/
create or replace function aws_oracle_ext.get_pg_sqlstate
  ( ora_code aws_oracle_ext.mapped_error_codes.ora_code%type )
  returns aws_oracle_ext.mapped_error_codes.pg_code%type
as
$body$
  declare
    l_pg_code aws_oracle_ext.mapped_error_codes.pg_code%type;
  begin
    select pg_code into strict l_pg_code
      from aws_oracle_ext.mapped_error_codes c
     where c.ora_code = get_pg_sqlstate.ora_code
       and pg_code is not null;

    return l_pg_code;
  exception
    when no_data_found then
      raise exception no_data_found 
      using message = format( 'No error code mapping is found for the Oracle error code (%s)', ora_code )
          , detail =  concat_ws
              ( 'There is no mapping found for the Oracle error code in the current version of Extension Pack: ', ora_code )
          , hint = 'Check the documentation on error code mappings, please.'    ;
  end;
$body$ language plpgsql immutable;
