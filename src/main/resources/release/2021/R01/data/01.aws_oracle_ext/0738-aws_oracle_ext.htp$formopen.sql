CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formOpen
(
    curl     IN TEXT,
    cmethod  IN TEXT DEFAULT 'post',
    ctarget  IN TEXT DEFAULT NULL,
    cenctype IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formOpen(curl,cmethod,ctarget,cenctype,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


