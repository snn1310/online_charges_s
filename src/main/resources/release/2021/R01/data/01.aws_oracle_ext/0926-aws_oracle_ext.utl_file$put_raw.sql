CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$put_raw
(
   file          IN    aws_oracle_ext.utl_file$file_type,
   buffer        IN    BYTEA, 
   autoflush     IN    BOOLEAN DEFAULT FALSE
)
RETURNS VOID
AS
$BODY$
DECLARE
    vDirectory TEXT;
    vBucket TEXT;
    vFilename TEXT;
    vOpenMode TEXT;
    vLen INTEGER;
    vOpenLen INTEGER;
    vResponse JSON;
    vPayload JSON;
    vErrorMessage TEXT;
    vEXCEPTION TEXT;
BEGIN

    SELECT f.open_mode,
        d.directory_name,
        f.open_filename,
        f.max_linesize,
        d.s3bucket
    INTO vOpenMode,
        vDirectory,
        vFilename,
        vOpenLen,
        vBucket
    FROM aws$utl_file_files f
    JOIN aws_oracle_ext.directory d ON d.directory_name = f.directory_name
    WHERE id = file.id;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_filehandle');

    END IF;

    IF UPPER(vOpenMode) NOT IN ('WB', 'AB') THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_operation');

    END IF;

    vPayload := JSON_BUILD_OBJECT
    (
        'Action', 'PUT_RAW',
        'Bucket', vBucket,
        'DIRECTORY', vDirectory,
        'filename', vFilename,
        'buffer', ENCODE(buffer, 'hex')
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

END;
$BODY$
LANGUAGE plpgsql;