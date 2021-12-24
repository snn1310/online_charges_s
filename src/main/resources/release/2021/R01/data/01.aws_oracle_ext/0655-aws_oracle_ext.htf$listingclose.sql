CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$listingClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</listing>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


