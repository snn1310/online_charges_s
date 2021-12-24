CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$mapOpen
(
    cname    IN TEXT,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$mapOpen(cname,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


