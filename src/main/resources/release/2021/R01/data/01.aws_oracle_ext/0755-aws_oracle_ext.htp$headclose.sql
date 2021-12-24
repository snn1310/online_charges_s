CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$headClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$headClose());
    
END;
$BODY$
LANGUAGE plpgsql;


