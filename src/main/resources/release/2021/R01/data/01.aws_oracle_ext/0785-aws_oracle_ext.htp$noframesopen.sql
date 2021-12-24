CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$noframesOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$noframesOpen());
    
END;
$BODY$
LANGUAGE plpgsql;


