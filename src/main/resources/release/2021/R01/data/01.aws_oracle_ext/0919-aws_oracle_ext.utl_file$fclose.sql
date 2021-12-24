CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fclose
(
    file INOUT aws_oracle_ext.utl_file$file_type
)
AS
$BODY$
BEGIN

    DELETE FROM aws$utl_file_files
    WHERE id = file.id;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_filehandle');        

    END IF;

END;
$BODY$
LANGUAGE plpgsql;