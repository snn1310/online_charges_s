CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$putf
(
    file    IN aws_oracle_ext.utl_file$file_type,
    format  IN TEXT,
    arg1    IN TEXT  DEFAULT NULL,
    arg2    IN TEXT  DEFAULT NULL,
    arg3    IN TEXT  DEFAULT NULL,
    arg4    IN TEXT  DEFAULT NULL,
    arg5    IN TEXT  DEFAULT NULL
)
RETURNS VOID
AS
$BODY$
DECLARE
    vText TEXT;
    vNl TEXT;
    vAddNewLine BOOLEAN DEFAULT TRUE;
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

    IF SUBSTR(REVERSE(format), 1, 2) = '\n' THEN

        vAddNewLine := FALSE;
        
    END IF;
    
    vText := REPLACE(format, '\n', vNl);

    vText := format(vText, arg1, arg2, arg3, arg4, arg5);

    IF vAddNewLine THEN

        vText := CONCAT(vText, vNl);

    EnD IF;

    PERFORM aws_oracle_ext.utl_file$put(file, vText);

END;
$BODY$
LANGUAGE plpgsql;