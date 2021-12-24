CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$area
(
    ccoords    IN TEXT,
    cshape    IN TEXT DEFAULT NULL,
    chref    IN TEXT DEFAULT NULL,
    cnohref IN TEXT DEFAULT NULL,
    ctarget IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$area(ccoords,cshape,chref,cnohref,ctarget,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


