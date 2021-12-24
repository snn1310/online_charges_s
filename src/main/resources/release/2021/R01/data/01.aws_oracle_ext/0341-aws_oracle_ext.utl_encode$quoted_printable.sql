create or replace function aws_oracle_ext.UTL_ENCODE$QUOTED_PRINTABLE() returns integer as
$BODY$  
begin
  return 2;
end;
$BODY$  
LANGUAGE plpgsql
IMMUTABLE;
