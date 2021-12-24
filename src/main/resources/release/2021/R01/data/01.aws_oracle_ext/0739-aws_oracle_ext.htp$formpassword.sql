CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formPassword
(
    cname       IN TEXT,
    csize       IN TEXT DEFAULT NULL,
    cmaxlength  IN TEXT DEFAULT NULL,
    cvalue      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formPassword(cname,csize,cmaxlength,cvalue,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                       
