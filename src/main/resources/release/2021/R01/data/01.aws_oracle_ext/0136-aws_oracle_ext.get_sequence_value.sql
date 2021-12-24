create or replace function aws_oracle_ext.get_sequence_value(aSchemaName varchar, 
                    aSequenceName varchar)
  returns bigint
as
$$
declare
  lVal bigint;
begin
  EXECUTE 'SELECT last_value from '||quote_ident(aSchemaName)||'.'||quote_ident(aSequenceName) into lVal;
  return lVal;    
  exception when others then
    return null;
end;
$$
language plpgsql;
