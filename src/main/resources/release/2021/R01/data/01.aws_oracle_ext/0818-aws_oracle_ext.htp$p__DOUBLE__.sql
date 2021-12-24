CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$p
(
    nbuf IN DOUBLE PRECISION
) 
RETURNS VOID AS
$BODY$
BEGIN

    INSERT INTO aws_htbuf_arr(column_value)
    SELECT CONCAT(
        aws_oracle_ext.to_char(nbuf),
        E'\n'
    );
    
END;
$BODY$
LANGUAGE plpgsql;


