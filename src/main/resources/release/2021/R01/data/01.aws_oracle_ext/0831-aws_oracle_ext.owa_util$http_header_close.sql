CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$http_header_close()
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$prn(E'\n');
    
END;
$BODY$
LANGUAGE plpgsql;

               
