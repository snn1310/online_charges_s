CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$htmlOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$htmlOpen);
    
END;
$BODY$
LANGUAGE plpgsql;


