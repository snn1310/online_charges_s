CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$centerClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</center>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


