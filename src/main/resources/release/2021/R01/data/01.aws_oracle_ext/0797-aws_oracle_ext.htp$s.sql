CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$s
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$s(ctext,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

            
