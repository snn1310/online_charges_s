create or replace function aws_oracle_ext.UTL_ENCODE$BASE64() returns integer as
$BODY$  
begin
  return 1;
end;
$BODY$  
LANGUAGE plpgsql
IMMUTABLE;

