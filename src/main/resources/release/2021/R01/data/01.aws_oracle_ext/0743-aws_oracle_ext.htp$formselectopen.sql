CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$formSelectOpen
(
    cname       IN TEXT,
    cprompt     IN TEXT DEFAULT NULL,
    nsize       IN NUMERIC  DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.formSelectOpen(cname,cprompt,nsize,cattributes));
    
END;
$BODY$
LANGUAGE plpgsql;

                         
