CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$menulistClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$menulistClose());
    
END;
$BODY$
LANGUAGE plpgsql;


