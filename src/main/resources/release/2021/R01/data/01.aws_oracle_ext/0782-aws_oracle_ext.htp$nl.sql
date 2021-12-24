CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$nl
(
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$nl(cclear,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


