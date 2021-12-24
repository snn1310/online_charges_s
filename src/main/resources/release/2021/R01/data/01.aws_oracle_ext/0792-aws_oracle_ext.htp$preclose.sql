CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$preClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$$preClose());
    
END;
$BODY$
LANGUAGE plpgsql;


