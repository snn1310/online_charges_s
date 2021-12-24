CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formSelectOption
(
    cvalue      IN TEXT,
    cselected   IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formSelectOption(cvalue,cselected,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                           
