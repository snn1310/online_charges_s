CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$dirlistOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.dirlistOpen());
    
END;
$BODY$
LANGUAGE plpgsql;


