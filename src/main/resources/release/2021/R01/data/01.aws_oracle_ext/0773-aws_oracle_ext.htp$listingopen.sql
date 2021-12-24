CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$listingOpen() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$listingOpen());
    
END;
$BODY$
LANGUAGE plpgsql;


