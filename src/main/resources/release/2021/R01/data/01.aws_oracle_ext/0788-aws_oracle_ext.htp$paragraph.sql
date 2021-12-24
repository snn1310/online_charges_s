CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$paragraph
(
    calign       IN TEXT DEFAULT NULL,
    cnowrap      IN TEXT DEFAULT NULL,
    cclear       IN TEXT DEFAULT NULL,
    cattributes  IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$paragraph(calign,cnowrap,cclear,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
