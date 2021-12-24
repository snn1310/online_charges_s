CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$dirlistClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$dirlistClose());
    
END;
$BODY$
LANGUAGE plpgsql;


