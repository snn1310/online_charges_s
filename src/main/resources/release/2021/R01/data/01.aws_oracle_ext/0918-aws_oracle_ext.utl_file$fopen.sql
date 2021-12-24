CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fopen
(
    location     IN TEXT,
    /*
    Directory location of file. This string is a directory object name and must be specified in upper case. Read privileges must be granted on this directory object for the UTL_FILE user to run FOPEN.
    */
    filename     IN TEXT,
    /*
    File name, including extension (file type), without directory path. If a directory path is given as a part of the filename, it is ignored by FOPEN. On Unix, the filename cannot end with /.
    */
    open_mode    IN TEXT,
    /*
    Specifies how the file is opened. Modes include:

        r -- read text

        w -- write text

        a -- append text

        rb -- read byte mode

        wb -- write byte mode

        ab -- append byte mode

        If you try to open a file specifying 'a' or 'ab' for open_mode but the file does not exist, the file is created in write mode.
    */
    max_linesize IN INTEGER DEFAULT NULL
    /*
    Maximum number of characters for each line, including the newline character, for this file (minimum value 1, maximum value 32767).
    If unspecified, Oracle supplies a default value of 1024.
    */
)
RETURNS aws_oracle_ext.utl_file$file_type 
AS
$BODY$
DECLARE
    vResult aws_oracle_ext.utl_file$file_type;
    vDirectory TEXT;
    vBucket TEXT;
    vResponse JSON;
    vPayload JSON;
    vErrorMessage TEXT;
    vEXCEPTION TEXT;
    vmax_linesize INTEGER;
BEGIN

    vmax_linesize := COALESCE(max_linesize, 1024);

    IF vmax_linesize NOT BETWEEN 1 AND 32767 THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_maxlinesize');

    END IF;

    IF ARRAY_POSITION(ARRAY['R', 'W', 'A', 'RB', 'WB', 'AB'], UPPER(open_mode)) IS NULL THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_mode');

    END IF;

    SELECT directory_name,
        s3bucket
    INTO vDirectory,
        vBucket
    FROM aws_oracle_ext.directory
    WHERE directory_name = location;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_path');

    END IF;

    vPayload := JSON_BUILD_OBJECT
    (
        'Action', 'FOPEN',
        'Bucket', vBucket,
        'DIRECTORY', vDirectory,
        'filename', filename,
        'openmode', open_mode
    );

    vResponse := aws_oracle_ext.awslambda_fn
    (
        aws_oracle_ext.get_service_setting
        (
            'UTL_FILE',
            'LAMBDA_ARN' 
        ),
        vPayload
    );
    
    IF vResponse -> 'error' IS NOT NULL THEN

        vEXCEPTION := vResponse -> 'error' ->> 'EXCEPTION';

        IF vEXCEPTION = '-1' THEN

            vErrorMessage := vResponse -> 'error' ->> 'Description';
            RAISE USING MESSAGE = vErrorMessage;

        END IF;

        PERFORM aws_oracle_ext.utl_file$exceptions(vEXCEPTION);

    END IF;

    IF vResponse::TEXT = 'null' THEN
    
        PERFORM aws_oracle_ext.utl_file$fhstorage();

        DELETE FROM aws$utl_file_files
        WHERE directory_name = vDirectory
        AND open_filename = filename;

        INSERT INTO aws$utl_file_files(open_mode, directory_name, open_filename, max_linesize)
        VALUES(LOWER(open_mode), vDirectory, filename, vmax_linesize)
        RETURNING id INTO vResult.id;

        vResult.datatype := 1;
        vResult.byte_mode := CASE WHEN UPPER(open_mode) LIKE '%B' THEN TRUE ELSE FALSE END;

    END IF;
    
    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;