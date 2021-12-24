CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formTextareaClose() 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formTextareaClose);
    
END;
$BODY$
LANGUAGE plpgsql;


