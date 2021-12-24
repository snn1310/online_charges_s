CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$framesetClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</frameset>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


