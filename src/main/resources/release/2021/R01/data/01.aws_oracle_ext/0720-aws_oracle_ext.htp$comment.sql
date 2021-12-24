CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$comment
(
    ctext IN TEXT
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$comment(ctext));
    
END;
$BODY$
LANGUAGE plpgsql;


