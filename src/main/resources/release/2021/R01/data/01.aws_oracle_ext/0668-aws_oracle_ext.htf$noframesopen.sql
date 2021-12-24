CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$noframesOpen() 
RETURNS TEXT AS
$BODY$

    SELECT '<noframes>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


