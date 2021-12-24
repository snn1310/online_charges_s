CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formSubmit
(
    cname       IN TEXT DEFAULT NULL,
    cvalue      IN TEXT  DEFAULT 'Submit',
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="submit"',
                      aws_oracle_ext.htf$ifnotnull(cname, concat_ws('', ' name="', cname, '"')),
                      aws_oracle_ext.htf$ifnotnull(cvalue, concat_ws('', ' value="', cvalue, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


