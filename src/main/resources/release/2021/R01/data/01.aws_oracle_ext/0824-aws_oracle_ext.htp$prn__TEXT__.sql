CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$prn
(
    cbuf IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    INSERT INTO aws_htbuf_arr(column_value)
    SELECT CONCAT(
        cbuf
    );
    
END;
$BODY$
LANGUAGE plpgsql;