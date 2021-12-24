CREATE OR REPLACE FUNCTION aws_oracle_ext.round
(
    value DATE,
    fmt TEXT
)
RETURNS DATE
AS
$$ 
SELECT aws_oracle_ext.round($1::TIMESTAMP(0), $2)::DATE;
$$
LANGUAGE SQL
IMMUTABLE 
STRICT;
