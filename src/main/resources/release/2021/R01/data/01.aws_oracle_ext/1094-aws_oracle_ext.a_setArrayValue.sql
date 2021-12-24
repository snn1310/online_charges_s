CREATE OR REPLACE FUNCTION aws_oracle_ext.a_setArrayValue
(
    IN ppath TEXT,
    IN pprocedurename TEXT,
    IN pvalue ANYELEMENT
)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    pathParts TEXT[];
    vstoragetable TEXT;
    vSQL TEXT;
    vIndexBy TEXT;
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

    IF vstoragetable IS NULL THEN

        RETURN FALSE;

    END IF;
    
    vSQL := CONCAT
    (
        'INSERT INTO ',
        vstoragetable,
        $$
        AS t(id, record_body) VALUES (CAST($1 AS $$,
        vIndexBy,
        $$), aws_oracle_ext.json_set_by_path('{}'::JSONB, $2, $3))
        ON CONFLICT (id) DO UPDATE
        SET record_body = aws_oracle_ext.json_set_by_path(t.record_body, $2, $3)
        $$
    );

    EXECUTE vSQL USING pathParts[2], ppath, pvalue;

    RETURN TRUE;

END;
$BODY$;
