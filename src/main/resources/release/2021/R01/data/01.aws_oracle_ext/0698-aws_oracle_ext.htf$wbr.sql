CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$wbr() 
RETURNS TEXT AS
$BODY$

    SELECT '<wbr>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


