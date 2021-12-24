CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formImage
(
    cname       IN TEXT,
    csrc        IN TEXT,
    calign      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formImage(cname,csrc,calign,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
