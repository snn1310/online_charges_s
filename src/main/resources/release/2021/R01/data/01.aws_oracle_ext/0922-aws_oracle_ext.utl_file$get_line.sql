CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$get_line
(
    file   IN   aws_oracle_ext.utl_file$file_type,
    buffer OUT  TEXT,
    len    IN   INTEGER DEFAULT NULL
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
    vPos INTEGER;
    vData TEXT;
    vNl TEXT;
    vNLpos INTEGER;
    vText TEXT;
BEGIN

    SELECT f.open_mode,
        d.directory_name,
        f.open_filename,
        f.max_linesize,
        d.s3bucket,
        f.text_contents,
        f.fpos
    INTO vOpenMode,
        vDirectory,
        vFilename,
        vOpenLen,
        vBucket,
        vText,
        vPos
    FROM aws$utl_file_files f
    JOIN aws_oracle_ext.directory d ON d.directory_name = f.directory_name
    WHERE id = file.id;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_filehandle');

    END IF;

    IF UPPER(vOpenMode) <> 'R' THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_operation');

    END IF;

    IF vText IS NULL THEN

        vPayload := JSON_BUILD_OBJECT
        (
            'Action', 'GET_LINE',
            'Bucket', vBucket,
            'DIRECTORY', vDirectory,
            'filename', vFilename,
            'pos', 0,
            'len', 0
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

        vData := vResponse ->> 'data';

        vNl := COALESCE
        (
            aws_oracle_ext.get_service_setting
            (
                'UTL_FILE',
                'NEWLINE' 
            ),
            E'\n'
        );

        IF vNl <> E'\n' THEN
            
            vData := REPLACE(vData, vNl, E'\n');

        END IF;
    
        UPDATE aws$utl_file_files
        SET text_contents = vData;

        vText := vData;

    END IF;
    
    vData := SUBSTR(vText, vPos + 1);

    IF LENGTH(vData) = 0 THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('read_error');

    END IF;

    vNLpos := POSITION(E'\n' IN vData);

    IF (vNLpos = 0 AND LENGTH(vData) >= vOpenLen) OR (vNLpos > vOpenLen) THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('read_error');

    END IF;

    vLen := LEAST(len, vOpenLen);
    
    vData := SUBSTR
    (
        vData,
        1,
        CASE
            WHEN vNLpos <> 0 THEN
                LEAST(vLen, vNLpos)
            ELSE
                vLen
        END
    );

    vPos := LENGTH(vData);

    buffer := REPLACE(vData, E'\n', '');

    UPDATE aws$utl_file_files
    SET fpos = fpos + vPos;

END;
$BODY$
LANGUAGE plpgsql;