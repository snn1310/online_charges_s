CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$print
(
    dbuf IN TIMESTAMP WITHOUT TIME ZONE
) 
RETURNS VOID AS
$BODY$
BEGIN

    INSERT INTO aws_htbuf_arr(column_value)
    SELECT CONCAT(
        aws_oracle_ext.to_char(dbuf),
        E'\n'
    );
    
END;
$BODY$
LANGUAGE plpgsql;