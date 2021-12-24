CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$htitle
(
    ctitle      IN TEXT,
    nsize       IN NUMERIC  DEFAULT 1,
    calign      IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$htitle(ctitle,nsize,calign,cnowrap,cclear,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                 
