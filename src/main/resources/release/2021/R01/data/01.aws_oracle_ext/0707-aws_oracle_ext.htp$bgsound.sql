CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$bgsound
(
    csrc    IN TEXT,
    cloop    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$bgsound(csrc,cloop,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


