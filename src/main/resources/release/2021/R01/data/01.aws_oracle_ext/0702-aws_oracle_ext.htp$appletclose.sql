CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$appletClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$appletClose());
    
END;
$BODY$
LANGUAGE plpgsql;

