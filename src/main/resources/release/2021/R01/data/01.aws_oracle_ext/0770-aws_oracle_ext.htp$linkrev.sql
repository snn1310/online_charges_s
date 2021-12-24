CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$linkRev
(
    crev  IN TEXT,
    curl  IN TEXT,
    ctitle IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$linkRev(crev, curl, ctitle));
    
END;
$BODY$
LANGUAGE plpgsql;

                  
