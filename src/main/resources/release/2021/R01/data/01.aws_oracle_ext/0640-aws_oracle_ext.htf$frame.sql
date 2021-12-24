CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$frame
(
    csrc    IN TEXT,
    cname    IN TEXT DEFAULT NULL,
    cmarginwidth     IN TEXT DEFAULT NULL,
    cmarginheight    IN TEXT DEFAULT NULL,
    cscrolling    IN TEXT DEFAULT NULL,
    cnoresize    IN TEXT DEFAULT NULL,
    cattributes    IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<frame src="',
                     csrc,
                     '"',
                     aws_oracle_ext.htf$ifnotnull(cname, concat_ws('', ' name="', cname, '"')),
                     aws_oracle_ext.htf$ifnotnull(cmarginwidth, concat_ws('', ' marginwidth="', cmarginwidth, '"')),
                     aws_oracle_ext.htf$ifnotnull(cmarginheight, concat_ws('', ' marginheight="', cmarginheight, '"')),
                     aws_oracle_ext.htf$ifnotnull(cscrolling, concat_ws('', ' scrolling="', cscrolling, '"')),
                     aws_oracle_ext.htf$ifnotnull(cnoresize, concat_ws('', ' noresize="noresize"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     '/>');

$BODY$
LANGUAGE SQL
IMMUTABLE;


