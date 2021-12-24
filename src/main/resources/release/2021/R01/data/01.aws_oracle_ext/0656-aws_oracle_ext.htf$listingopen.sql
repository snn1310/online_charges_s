CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$listingOpen() 
RETURNS TEXT AS
$BODY$

    SELECT '<listing>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


