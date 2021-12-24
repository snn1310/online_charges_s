CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$linkRel
(
    crel   IN TEXT,
    curl   IN TEXT,
    ctitle IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$linkRel(crel, curl, ctitle));
    
END;
$BODY$
LANGUAGE plpgsql;

                  
