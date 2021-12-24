CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$line
(
    cclear      IN TEXT DEFAULT NULL,
    csrc        IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$hr(cclear, csrc, cattributes);
    
END;
$BODY$
LANGUAGE plpgsql;

               
