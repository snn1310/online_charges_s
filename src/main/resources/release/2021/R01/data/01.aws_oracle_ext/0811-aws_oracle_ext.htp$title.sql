CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$title
(
    ctitle IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$title(ctitle));
    
END;
$BODY$
LANGUAGE plpgsql;


