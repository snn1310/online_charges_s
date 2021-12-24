CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$img
(
    curl        IN TEXT,
    calign      IN TEXT DEFAULT NULL,
    calt        IN TEXT DEFAULT NULL,
    cismap      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<img src="',
                     curl,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(calign, concat_ws('', ' align="',calign,'"')),
                     aws_oracle_ext.htf$ifnotnull(calt, concat_ws('', ' alt="',calt,'"')),
                     aws_oracle_ext.htf$ifnotnull(cismap, concat_ws('', ' ismap="ismap"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ',cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


