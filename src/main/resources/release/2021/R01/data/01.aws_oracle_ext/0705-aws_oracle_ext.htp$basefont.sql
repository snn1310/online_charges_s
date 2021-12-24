CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$basefont
(
    nsize IN NUMERIC
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$basefont(nsize));
    
END;
$BODY$
LANGUAGE plpgsql;


