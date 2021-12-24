CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formClose());
    
END;
$BODY$
LANGUAGE plpgsql;


