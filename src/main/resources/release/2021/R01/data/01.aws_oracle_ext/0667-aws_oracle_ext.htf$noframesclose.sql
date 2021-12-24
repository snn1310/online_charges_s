CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$noframesClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</noframes>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


