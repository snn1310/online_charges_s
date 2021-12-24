CREATE OR REPLACE FUNCTION aws_oracle_ext.nanvl(NUMERIC, VARCHAR)
RETURNS NUMERIC 
AS
$$ SELECT CASE WHEN $1 = 'NaN' THEN $2::NUMERIC ELSE $1 END; $$
LANGUAGE SQL
IMMUTABLE 
STRICT;
