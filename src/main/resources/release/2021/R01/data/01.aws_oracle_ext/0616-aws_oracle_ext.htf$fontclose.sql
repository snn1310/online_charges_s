CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$fontClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</font>';

$BODY$
LANGUAGE SQL
IMMUTABLE;

