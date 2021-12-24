CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$exceptions
(
    src_exception IN TEXT
)
RETURNS VOID
AS
$BODY$
DECLARE
    oracodes CONSTANT JSONB :=
    '
    {
        "invalid_path": {
            "code": -29280,
            "message": "invalid directory path"
        },
        "invalid_mode": {
            "code": -29281,
            "message": "invalid mode"
        },
        "invalid_filehandle": {
            "code": -29282,
            "message": "invalid file ID"
        },
        "invalid_operation": {
            "code": -29283,
            "message": "invalid file operation"
        },
        "read_error": {
            "code": -29284,
            "message": "file read error"
        },
        "write_error": {
            "code": -29285,
            "message": "file write error"
        },
        "internal_error": {
            "code": -29286,
            "message": "internal error"
        },
        "charsetmismatch": {
            "code": -29298,
            "message": "Character set mismatch"
        },
        "invalid_maxlinesize": {
            "code": -29287,
            "message": "invalid maximum line size"
        },
        "invalid_filename": {
            "code": -29288,
            "message": "invalid file name"
        },
        "access_denied": {
            "code": -29289,
            "message": "directory access denied"
        },
        "invalid_offset": {
            "code": -29290,
            "message": "invalid offset specified for seek"
        },
        "delete_failed": {
            "code": -29291,
            "message": "file remove operation failed"
        },
        "rename_failed": {
            "code": -29292,
            "message": "file rename operation failed"
        }
    }
    '::JSONB;
    vCode TEXT;
    vException TEXT;
    vMessage TEXT;
BEGIN

    vException := TRIM(LOWER(src_exception));

    IF vException = 'no_data_found' THEN

        RAISE no_data_found;

    END IF;

    IF NOT oracodes ? vException THEN

        RAISE UNDEFINED_OBJECT;

    ELSE

        vCode := oracodes -> vException ->> 'code' ;

        vMessage := oracodes -> vException ->> 'message';
        
        RAISE USING HINT = vCode, message = vMessage;

    END IF;

END;        
$BODY$
LANGUAGE plpgsql;