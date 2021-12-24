CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formSelectClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formSelectClose());
    
END;
$BODY$
LANGUAGE plpgsql;


