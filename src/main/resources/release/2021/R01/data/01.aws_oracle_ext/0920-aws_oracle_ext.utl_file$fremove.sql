CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fremove
(
    location IN TEXT,
    filename IN TEXT
)
RETURNS VOID
AS
$BODY$
DECLARE
    vDirectory TEXT;
    vBucket TEXT;
    vResponse JSON;
    vPayload JSON;
    vErrorMessage TEXT;
    vEXCEPTION TEXT;
BEGIN

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
        'Action', 'FREMOVE',
        'Bucket', vBucket,
        'DIRECTORY', vDirectory,
        'filename', filename
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