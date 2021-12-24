CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$new_line
(
   file     IN aws_oracle_ext.utl_file$file_type,
   lines    IN INTEGER  DEFAULT 1
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

    vNl := REPEAT(vNl, lines);

    PERFORM aws_oracle_ext.utl_file$put(file, vNl);

END;
$BODY$
LANGUAGE plpgsql;