CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$blockquoteClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</blockquote>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


