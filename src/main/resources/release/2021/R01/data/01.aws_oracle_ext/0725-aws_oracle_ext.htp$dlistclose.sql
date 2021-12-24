CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$dlistClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.dlistClose());
    
END;
$BODY$
LANGUAGE plpgsql;


