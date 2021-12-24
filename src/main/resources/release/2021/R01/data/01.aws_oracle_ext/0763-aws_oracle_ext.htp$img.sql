CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$img
(
    curl        IN TEXT,
    calign      IN TEXT DEFAULT NULL,
    calt        IN TEXT DEFAULT NULL,
    cismap      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$img(curl,calign,calt,cismap,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

              
