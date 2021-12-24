CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$framesetOpen
(
    crows IN TEXT DEFAULT NULL,
    ccols IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$framesetOpen( crows, ccols, cattributes ));
    
END;
$BODY$
LANGUAGE plpgsql;

            
