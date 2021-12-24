CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$ulistOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cwrap       IN TEXT DEFAULT NULL,
    cdingbat    IN TEXT DEFAULT NULL,
    csrc        IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$ulistOpen(cclear,cwrap,cdingbat,csrc,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
