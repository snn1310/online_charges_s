CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$menulistClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</menu>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


