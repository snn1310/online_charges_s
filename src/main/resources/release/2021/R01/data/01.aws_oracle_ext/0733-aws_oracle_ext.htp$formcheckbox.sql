CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formCheckbox
(
    cname       IN TEXT,
    cvalue      IN TEXT DEFAULT 'on',
    cchecked    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formCheckbox(cname,cvalue,cchecked,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                       
