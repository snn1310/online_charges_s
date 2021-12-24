CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$get_raw
(
   file       IN   aws_oracle_ext.utl_file$file_type, 
   buffer     OUT  BYTEA, 
   len        IN   INTEGER DEFAULT NULL
)
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
    vPos BIGINT;
    vData TEXT;
BEGIN

    SELECT f.open_mode,
        d.directory_name,
        f.open_filename,
        f.max_linesize,
        d.s3bucket,
        f.fpos
    INTO vOpenMode,
        vDirectory,
        vFilename,
        vOpenLen,
        vBucket,
        vPos
    FROM aws$utl_file_files f
    JOIN aws_oracle_ext.directory d ON d.directory_name = f.directory_name
    WHERE id = file.id;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_filehandle');

    END IF;

    IF UPPER(vOpenMode) <> 'RB' THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_operation');

    END IF;

    vLen := COALESCE(len, 32767);

    vPayload := JSON_BUILD_OBJECT
    (
        'Action', 'GET_RAW',
        'Bucket', vBucket,
        'DIRECTORY', vDirectory,
        'filename', vFilename,
        'pos', vPos,
        'len', vLen
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

    SELECT STRING_AGG(UPPER(LPAD(TO_HEX(v::INT), 2, '0')),''),
        COUNT(*)
    INTO vData, vPos
    FROM JSON_ARRAY_ELEMENTS_TEXT(vResponse -> 'data') AS v;

    buffer := DECODE(vData, 'hex');

    UPDATE aws$utl_file_files
    SET fpos = fpos + vPos;

END;
$BODY$
LANGUAGE plpgsql;