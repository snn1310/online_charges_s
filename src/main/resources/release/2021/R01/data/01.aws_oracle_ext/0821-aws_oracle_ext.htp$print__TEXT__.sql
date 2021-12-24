CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$print
(
    cbuf IN TEXT DEFAULT NULL
) 
RETURNS VOID AS
$BODY$
BEGIN

    INSERT INTO aws_htbuf_arr(column_value)
    SELECT CONCAT(
        cbuf,
        E'\n'
    );
    
END;
$BODY$
LANGUAGE plpgsql;