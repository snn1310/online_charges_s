CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$param
(
    cname        IN TEXT,
    cvalue        IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$param(cname,cvalue));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
