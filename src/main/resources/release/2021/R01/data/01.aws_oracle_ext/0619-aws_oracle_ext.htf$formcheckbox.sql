CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formCheckbox
(
    cname       IN TEXT,
    cvalue      IN TEXT  DEFAULT 'on',
    cchecked    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="checkbox" name="',
                     cname,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cvalue, concat_ws('', ' value="', cvalue, '"')),
                     aws_oracle_ext.htf$ifnotnull(cchecked, ' checked="checked"'),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


