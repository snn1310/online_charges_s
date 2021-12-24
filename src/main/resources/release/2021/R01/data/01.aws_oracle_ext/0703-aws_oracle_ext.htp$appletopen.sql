CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$appletOpen
(
    ccode        IN TEXT,
    cwidth       IN NUMERIC,
    cheight      IN NUMERIC,
    cattributes  IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$appletOpen());
    
END;
$BODY$
LANGUAGE plpgsql;

                         
