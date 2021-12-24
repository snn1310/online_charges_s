CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formHidden
(
    cname       IN TEXT,
    cvalue      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formHidden(cname,cvalue,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                     
