CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$mapOpen
(
    cname       IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('', 
                     '<map name="',
                     cname,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ',cattributes)),
                     '>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


