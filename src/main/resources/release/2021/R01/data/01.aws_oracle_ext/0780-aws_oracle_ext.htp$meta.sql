CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$meta
(
    chttp_equiv IN TEXT,
    cname       IN TEXT,
    ccontent    IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$meta(chttp_equiv, cname, ccontent));
    
END;
$BODY$
LANGUAGE plpgsql;

               
