CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$tableRowOpen
(
    calign      IN TEXT DEFAULT NULL,
    cvalign     IN TEXT DEFAULT NULL,
    cdp         IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$tableRowOpen(calign,cvalign,cdp,cnowrap,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                       
