CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$centerOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$centerOpen());
    
END;
$BODY$
LANGUAGE plpgsql;


