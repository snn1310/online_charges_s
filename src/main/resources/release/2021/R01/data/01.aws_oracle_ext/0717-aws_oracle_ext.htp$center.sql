CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$center
(
    ctext IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$center(ctext));
    
END;
$BODY$
LANGUAGE plpgsql;


