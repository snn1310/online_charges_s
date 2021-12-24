CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$nextid
(
    cidentifier IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$nextid(cidentifier));
    
END;
$BODY$
LANGUAGE plpgsql;


