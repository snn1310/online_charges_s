CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$anchor2
(
    curl        IN TEXT,
    ctext       IN TEXT,
    cname       IN TEXT DEFAULT NULL,
    ctarget     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$anchor2(curl,ctext,cname,ctarget,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                 
