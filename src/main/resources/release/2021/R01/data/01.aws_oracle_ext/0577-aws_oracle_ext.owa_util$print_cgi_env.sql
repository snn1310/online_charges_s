CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$print_cgi_env()
RETURNS VOID AS
$BODY$
DECLARE
    rec RECORD;
BEGIN

    FOR rec IN
    (
        SELECT cgi_var_name,
            cgi_var_val
        FROM aws_cgi_env
        ORDER BY id
    ) LOOP
        
        PERFORM aws_oracle_ext.htp$print
        (
            CONCAT
            (
                rec.cgi_var_name,
                ' = ',
                rec.cgi_var_val,
                aws_oracle_ext.htf$nl()
            )
        );

    END LOOP;
    
END;
$BODY$
LANGUAGE plpgsql;

               
