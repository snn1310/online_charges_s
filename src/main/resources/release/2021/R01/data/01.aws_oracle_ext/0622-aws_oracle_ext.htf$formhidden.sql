CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formHidden
(
    cname       IN TEXT,
    cvalue      IN TEXT  DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="hidden" name="',
                     cname,
                     '"',
                     ' value="',
                     cvalue,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


