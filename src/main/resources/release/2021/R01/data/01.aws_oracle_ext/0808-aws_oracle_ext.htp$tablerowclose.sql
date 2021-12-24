CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$tableRowClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$tableClose());
    
END;
$BODY$
LANGUAGE plpgsql;


