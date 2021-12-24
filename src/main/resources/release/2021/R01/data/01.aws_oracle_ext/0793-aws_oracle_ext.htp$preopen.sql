CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$preOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cwidth      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$preOpen(cclear,cwidth,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                  
