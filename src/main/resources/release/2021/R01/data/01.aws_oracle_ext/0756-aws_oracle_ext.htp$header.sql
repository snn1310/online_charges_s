CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$header
(
    nsize   IN NUMERIC,
    cheader IN TEXT,
    calign  IN TEXT DEFAULT NULL,
    cnowrap IN TEXT DEFAULT NULL,
    cclear  IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$header(nsize,cheader,calign,cnowrap,cclear,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                 
