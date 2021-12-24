CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formReset
(
    cvalue      IN TEXT  DEFAULT 'Reset',
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('', 
                     '<input type="reset" value="',
                     cvalue,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


