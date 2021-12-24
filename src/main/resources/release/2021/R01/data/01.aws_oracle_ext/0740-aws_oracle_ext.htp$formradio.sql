CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formRadio
(
    cname       IN TEXT,
    cvalue      IN TEXT,
    cchecked    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formRadio(cname,cvalue,cchecked,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
