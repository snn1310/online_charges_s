CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$centerOpen() 
RETURNS TEXT AS
$BODY$

    SELECT '<center>';

$BODY$
LANGUAGE SQL
IMMUTABLE;

