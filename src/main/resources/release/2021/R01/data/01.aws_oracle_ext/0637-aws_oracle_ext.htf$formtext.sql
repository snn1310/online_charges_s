CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$formText
(
    cname       IN TEXT,
    csize       IN TEXT DEFAULT NULL,
    cmaxlength  IN TEXT DEFAULT NULL,
    cvalue      IN TEXT  DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<input type="text" name="',
                     cname,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(csize, concat_ws('', ' size="', csize, '"')),
                     aws_oracle_ext.htf$ifnotnull(cmaxlength, concat_ws('', ' maxlength="', cmaxlength, '"')),
                     aws_oracle_ext.htf$ifnotnull(cvalue, concat_ws('', ' value="', cvalue, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '/>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


