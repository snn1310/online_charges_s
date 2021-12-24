CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$anchor
(
    curl        IN TEXT,
    ctext       IN TEXT,
    cname       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$anchor(curl,ctext,cname,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                 
