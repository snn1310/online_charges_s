CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$appletClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</applet>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


