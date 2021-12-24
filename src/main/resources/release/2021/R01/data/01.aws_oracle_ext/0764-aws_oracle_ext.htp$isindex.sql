CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$isindex
(
    cprompt IN TEXT DEFAULT NULL,
    curl    IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$isindex(cprompt, curl));
    
END;
$BODY$
LANGUAGE plpgsql;

                  
