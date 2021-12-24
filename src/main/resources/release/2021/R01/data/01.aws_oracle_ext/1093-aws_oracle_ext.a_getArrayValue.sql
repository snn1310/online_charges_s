CREATE OR REPLACE FUNCTION aws_oracle_ext.a_getArrayValue
(
    IN ppath TEXT,
    IN pprocedurename TEXT
)
RETURNS JSONB
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    pathParts TEXT[];
    vstoragetable TEXT;
    vSQL TEXT;
    vIndexBy TEXT;
    vres JSONB;
BEGIN
    
    pathParts := aws_oracle_ext.getPathparts(ppath);
    
    IF pathParts IS NULL THEN

        RETURN FALSE;

    END IF;

    SELECT storage_table_name,
        index_by
    INTO vstoragetable,
        vIndexBy
    FROM aws_oracle_ext$arrays a
    WHERE a.array_name = aws_oracle_ext.check_identifier_case(pathParts[1])
    AND a.procedure_name = pprocedurename;

    IF NOT FOUND THEN

        RAISE USING MESSAGE = 'Array structure must be initialized';

    END IF;

    vSQL := CONCAT
    (
        'SELECT record_body FROM ',
        vstoragetable,
        ' WHERE id = CAST($1 AS ',
        vIndexBy,
        ')'
    );

    EXECUTE vSQL INTO STRICT vres USING pathParts[2];

    vres := JSONB_BUILD_OBJECT
    (
        'result',
        vres
    );

    RETURN vres;

END;
$BODY$
