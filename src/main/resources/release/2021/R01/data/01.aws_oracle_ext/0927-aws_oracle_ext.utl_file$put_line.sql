CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$put_line
(
   file      IN aws_oracle_ext.utl_file$file_type,
   buffer    IN TEXT,
   autoflush IN BOOLEAN DEFAULT FALSE
)
RETURNS VOID
AS
$BODY$
DECLARE
    vNl TEXT;
BEGIN

    vNl := COALESCE
    (
        CASE
            WHEN aws_oracle_ext.get_service_setting
            (
                'UTL_FILE',
                'NEWLINE' 
            ) = '\r\n' THEN
                E'\r\n'
            ELSE
                NULL
        END,
        E'\n'
    );

    PERFORM  aws_oracle_ext.utl_file$put
    (
        $1,
        CONCAT
        (
            $2,
            vNl
        )
    );

END;
$BODY$
LANGUAGE plpgsql;