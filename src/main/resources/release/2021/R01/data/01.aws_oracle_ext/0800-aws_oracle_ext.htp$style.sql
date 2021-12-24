CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$style
(
    cstyle IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$style(cstyle));
    
END;
$BODY$
LANGUAGE plpgsql;


