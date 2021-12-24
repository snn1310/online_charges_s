CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$menulistOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$menulistOpen());
    
END;
$BODY$
LANGUAGE plpgsql;


