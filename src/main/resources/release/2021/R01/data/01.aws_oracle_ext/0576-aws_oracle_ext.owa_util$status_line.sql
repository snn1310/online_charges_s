CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$status_line
(
    nstatus        IN NUMERIC,
    creason        IN TEXT   DEFAULT NULL,
    bclose_header  IN BOOLEAN    DEFAULT TRUE
)
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$prn
    (
        CONCAT
        (
            'Status: ',
            nstatus,
            ' ',
            creason,
            E'\n'
        )
    );

    IF (bclose_header) THEN
        
        PERFORM aws_oracle_ext.owa_util$http_header_close();

    END IF;
    
END;
$BODY$
LANGUAGE plpgsql;

               
