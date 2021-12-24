CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$fontOpen
(
    ccolor    IN TEXT DEFAULT NULL,
    cface    IN TEXT DEFAULT NULL,
    csize    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$fontOpen(ccolor,cface,csize,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

        
