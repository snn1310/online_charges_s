CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$div
(
    calign       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.div(calign,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                
