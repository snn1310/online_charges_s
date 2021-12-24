CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formSelectClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</select>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


