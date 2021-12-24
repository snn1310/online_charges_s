CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$prints
(
    ctext IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$escape_sc(ctext));
    
END;
$BODY$
LANGUAGE plpgsql;


