CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formFile
(
    cname       IN TEXT,
    caccept     IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formFile(cname,caccept,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                   
