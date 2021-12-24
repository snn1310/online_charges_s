CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$basefont
(
    nsize       IN NUMERIC,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT CONCAT_WS('' ,
                     '<basefont size="', 
                     nsize ,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


