CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$olistClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</ol>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


