CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formReset
(
    cvalue      IN TEXT DEFAULT 'Reset',
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formReset(cvalue,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
