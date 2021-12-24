CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$listItem
(
    ctext       IN TEXT DEFAULT NULL,
    cclear      IN TEXT DEFAULT NULL,
    cdingbat    IN TEXT DEFAULT NULL,
    csrc        IN TEXT DEFAULT NULL,
                   cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$listItem(ctext,cclear,cdingbat,csrc,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                   
