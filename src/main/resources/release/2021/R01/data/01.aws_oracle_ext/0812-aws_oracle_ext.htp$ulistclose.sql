CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$ulistClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$ulistClose());
    
END;
$BODY$
LANGUAGE plpgsql;


