CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formTextareaOpen2
(
    cname       IN TEXT,
    nrows       IN NUMERIC,
    ncolumns    IN NUMERIC,
    calign      IN TEXT DEFAULT NULL,
    cwrap       IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formTextareaOpen2(cname,nrows,ncolumns,calign,cwrap,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                           
