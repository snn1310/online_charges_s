CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$bodyClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$bodyClose());
    
END;
$BODY$
LANGUAGE plpgsql;


