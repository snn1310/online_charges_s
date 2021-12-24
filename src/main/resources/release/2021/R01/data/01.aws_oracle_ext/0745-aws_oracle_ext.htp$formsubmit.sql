CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formSubmit
(
    cname       IN TEXT DEFAULT NULL,
    cvalue      IN TEXT DEFAULT 'Submit',
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formSubmit(cname,cvalue,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                     
