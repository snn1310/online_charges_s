CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$blockquoteClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$blockquoteClose());
    
END;
$BODY$
LANGUAGE plpgsql;


