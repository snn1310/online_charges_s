CREATE OR REPLACE FUNCTION aws_oracle_ext.hex_to_int(hexval text)
RETURNS integer
AS
$$
DECLARE
  result  int;
BEGIN
  EXECUTE 'SELECT x' || quote_literal(hexval) || '::int' INTO result;
  --EXECUTE 'SELECT x''' || hexval || '''::int' INTO result;
  RETURN result;
END; 
$$ 
LANGUAGE 'plpgsql' 
IMMUTABLE 
STRICT;
