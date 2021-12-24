CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$strike
(
    ctext IN TEXT,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$strike(ctext,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                 
