CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$listHeader
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<lh',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ',cattributes)),
                     '>',
                     ctext,
                     '</lh>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


