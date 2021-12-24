CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fcopy
(
    src_location  IN TEXT,
    src_filename  IN TEXT,
    dest_location IN TEXT,
    dest_filename IN TEXT,
    start_line    IN INTEGER DEFAULT 1,
    end_line      IN INTEGER DEFAULT NULL
)
RETURNS VOID
AS
$BODY$
DECLARE
    vDirectory TEXT;
    vsrcBucket TEXT;
    vdstBucket TEXT;
    vResponse JSON;
    vPayload JSON;
    vErrorMessage TEXT;
    vEXCEPTION TEXT;
BEGIN

    SELECT directory_name,
        s3bucket
    INTO vDirectory,
        vsrcBucket
    FROM aws_oracle_ext.directory
    WHERE directory_name = src_location;

    IF NOT FOUND THEN

        PERFORM aws_oracle_ext.utl_file$exceptions('invalid_path');

    END IF;

    IF src_location <> dest_location THEN

        SELECT directory_name,
            s3bucket
        INTO vDirectory,
            vdstBucket
        FROM aws_oracle_ext.directory
        WHERE directory_name = dest_location;

        IF NOT FOUND THEN

            PERFORM aws_oracle_ext.utl_file$exceptions('invalid_path');

        END IF;

    ELSE

        vdstBucket := vsrcBucket;

    END IF;

    vPayload := JSON_BUILD_OBJECT
    (
        'Action', 'FCOPY',
        'srcBucket', vsrcBucket,
        'srcDIRECTORY', src_location,
        'srcFilename', src_filename,
        'dstBucket', vdstBucket,
        'dstDIRECTORY', dest_location,
        'dstFilename', dest_filename
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