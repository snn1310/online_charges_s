CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$sup
(
    ctext         IN TEXT,
    calign        IN TEXT DEFAULT NULL,
    cattributes     IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$sup(ctext,calign,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


