CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$wbr() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$wbr());
    
END;
$BODY$
LANGUAGE plpgsql;


