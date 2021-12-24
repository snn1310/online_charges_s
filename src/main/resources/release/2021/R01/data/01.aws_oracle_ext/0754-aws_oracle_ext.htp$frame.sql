CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$frame
(
    csrc    IN TEXT,
    cname    IN TEXT DEFAULT NULL,
    cmarginwidth     IN TEXT DEFAULT NULL,
    cmarginheight    IN TEXT DEFAULT NULL,
    cscrolling    IN TEXT DEFAULT NULL,
    cnoresize    IN TEXT DEFAULT NULL,
    cattributes     IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$frame( csrc, cname, cmarginwidth, cmarginheight, cscrolling, cnoresize, cattributes ));
    
END;
$BODY$
LANGUAGE plpgsql;

            
