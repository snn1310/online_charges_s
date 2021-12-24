CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$centerClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$centerClose());
    
END;
$BODY$
LANGUAGE plpgsql;


