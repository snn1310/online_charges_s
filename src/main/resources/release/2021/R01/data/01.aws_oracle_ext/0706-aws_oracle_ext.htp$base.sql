CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$base
(
    ctarget    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$base(ctarget,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

        
