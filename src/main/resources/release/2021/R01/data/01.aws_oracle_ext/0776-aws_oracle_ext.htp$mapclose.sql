CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$mapClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$mapClose());
    
END;
$BODY$
LANGUAGE plpgsql;


