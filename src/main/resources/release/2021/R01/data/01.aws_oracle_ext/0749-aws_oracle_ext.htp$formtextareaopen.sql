CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formTextareaOpen
(
    cname       IN TEXT,
    nrows       IN NUMERIC,
    ncolumns    IN NUMERIC,
    calign      IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$formTextareaOpen(cname,nrows,ncolumns,calign,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;


