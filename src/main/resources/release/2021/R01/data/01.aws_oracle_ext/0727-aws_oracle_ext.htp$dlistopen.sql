CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$dlistOpen
(
    cclear      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.dlistOpen(cclear,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                    
