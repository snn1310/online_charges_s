CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$framesetClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$framesetClose);
    
END;
$BODY$
LANGUAGE plpgsql;


