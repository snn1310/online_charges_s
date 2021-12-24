CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$olistClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$olistClose());
    
END;
$BODY$
LANGUAGE plpgsql;


