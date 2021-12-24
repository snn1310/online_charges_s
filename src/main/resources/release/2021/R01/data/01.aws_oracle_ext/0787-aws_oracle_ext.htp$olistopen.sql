CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$olistOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cwrap       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$olistOpen(cclear,cwrap,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
