CREATE OR REPLACE FUNCTION aws_oracle_ext.nanvl(FLOAT8, FLOAT8)
RETURNS FLOAT8 
AS
$$ SELECT CASE WHEN $1 = 'NaN' THEN $2 ELSE $1 END; $$
LANGUAGE SQL
IMMUTABLE 
STRICT;