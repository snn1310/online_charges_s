CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$area
(
    ccoords     IN TEXT,
    cshape      IN TEXT DEFAULT NULL,
    chref       IN TEXT DEFAULT NULL,
    cnohref     IN TEXT DEFAULT NULL,
    ctarget     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

      SELECT CONCAT_WS('',
                       '<area',
                       aws_oracle_ext.htf$ifnotnull(cshape,' shape="'||cshape||'"'),
                       ' coords="',
                       ccoords,'"',
                       aws_oracle_ext.htf$ifnotnull(chref, concat_ws('', ' href="', chref, '"')),
                       aws_oracle_ext.htf$ifnotnull(cnohref, concat_ws('', ' nohref="nohref"')),
                       aws_oracle_ext.htf$ifnotnull(ctarget, concat_ws('', ' target="', ctarget, '"')),
                       aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                       ' />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


