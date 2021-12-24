--DROP FUNCTION aws_oracle_ext.round(value timestamp without time zone);
CREATE OR REPLACE FUNCTION aws_oracle_ext.round(value TIMESTAMP WITHOUT TIME ZONE)
RETURNS TIMESTAMP WITHOUT TIME ZONE
AS 
$$ 
SELECT aws_oracle_ext.round($1, 'DDD'); 
$$
LANGUAGE SQL 
IMMUTABLE 
STRICT;
