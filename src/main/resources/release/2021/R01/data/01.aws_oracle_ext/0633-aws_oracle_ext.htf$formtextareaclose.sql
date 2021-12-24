CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formTextareaClose() 
RETURNS TEXT AS
$BODY$

    SELECT '</textarea>';

$BODY$
LANGUAGE SQL
IMMUTABLE;


