CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$is_open
(
    file IN aws_oracle_ext.utl_file$file_type
)
RETURNS BOOLEAN
AS
$BODY$
DECLARE
    vResult BOOLEAN DEFAULT FALSE;
BEGIN

    SELECT TRUE
    INTO
    vResult
    FROM aws$utl_file_files
    WHERE id = file.id;

    IF NOT FOUND THEN

        vResult := FALSE;

    END IF;

    RETURN vResult;

EXCEPTION
    WHEN undefined_table THEN
    
        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_filehandle');

END;
$BODY$
LANGUAGE plpgsql;