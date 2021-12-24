CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$img2
(
    curl        IN TEXT,
    calign      IN TEXT DEFAULT NULL,
    calt        IN TEXT DEFAULT NULL,
    cismap      IN TEXT DEFAULT NULL,
    cusemap     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$img2(curl,calign,calt,cismap,cusemap,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

              
