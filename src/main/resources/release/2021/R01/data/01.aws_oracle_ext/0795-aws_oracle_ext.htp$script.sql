CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$script
(
    cscript     IN TEXT,
    clanguage     IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$script(cscript, clanguage));
    
END;
$BODY$
LANGUAGE plpgsql;


