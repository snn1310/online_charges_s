create or replace function aws_oracle_ext.get_ora_sqlcode( in ora_exception aws_oracle_ext.mapped_error_codes.ora_exception%type )
  returns aws_oracle_ext.mapped_error_codes.ora_code%type
 as
 $$
  declare
    l_ora_code aws_oracle_ext.mapped_error_codes.ora_code%type;
  begin
    select ora_code into strict l_ora_code
      from aws_oracle_ext.mapped_error_codes c
     where c.ora_exception = upper( get_ora_sqlcode.ora_exception )
       and ora_code is not null;

    return l_ora_code;
  exception
    when no_data_found then
      raise exception no_data_found 
      using message = format( 'No error code is found for the Oracle built-in exception (%s)', ora_exception )
          , detail =  concat_ws
              ( 'There is no mapping found for the Oracle error code in the current version of Extension Pack: ', ora_exception )
          , hint = 'Check the documentation on error code mappings, please.';
  end;
$$ language plpgsql immutable; 
