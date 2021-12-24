CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formRadio
(
    cname       IN TEXT,
    cvalue      IN TEXT,
    cchecked    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="radio" name="',
                      cname,
                     'value="',
                     cvalue,
                     aws_oracle_ext.htf$ifnotnull(cchecked,' checked="checked"'),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


