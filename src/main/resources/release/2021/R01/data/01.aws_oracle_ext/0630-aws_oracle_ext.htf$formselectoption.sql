CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formSelectOption
(
    cvalue      IN TEXT,
    cselected   IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<option',
                     aws_oracle_ext.htf$ifnotnull(cselected, concat_ws('', ' selected="selected"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '</option>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


