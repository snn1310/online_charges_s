CREATE OR REPLACE FUNCTION aws_oracle_ext.json_set_by_path
(
    IN src JSONB,
    IN ppath TEXT,
    IN pvalue ANYELEMENT
)
RETURNS JSONB
IMMUTABLE PARALLEL SAFE
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    pathParts TEXT[];
    valuetype TEXT;
    vres JSONB;
    vpart TEXT;
    vdatatype TEXT;
    vproxy JSONB;
    vleaf JSONB;
BEGIN

    SELECT JSONB_TYPEOF
    (
        JSONB_BUILD_OBJECT
        (
            'tst',
            pvalue
        ) -> 'tst'
    )
    INTO valuetype;

    pathParts := REGEXP_SPLIT_TO_ARRAY
    (
        REPLACE
        (
            REPLACE
            (
                ppath,
                '[',
                '.'
            ),
            ']',
            ''
        ),
        '\.'
    );



    SELECT
        CASE
            WHEN pt.typtype = 'b' THEN
                'base'
            ELSE
                'udt'
        END
    INTO vdatatype
    FROM pg_type pt
    WHERE pt.oid = PG_TYPEOF(pvalue); 

    IF NOT FOUND THEN

        vdatatype := 'udt';

    END IF;

    -- simple case
    IF CARDINALITY(pathParts) = 2 THEN

        IF vdatatype = 'base' THEN

            vres := JSONB_BUILD_OBJECT
            (
                'column_value',
                TO_JSONB(pvalue)
            );

        ELSE

            SELECT TO_JSONB(z)
            INTO vres
            FROM JSONB_POPULATE_RECORD
            (
                pvalue,
                TO_JSONB(pvalue)
            ) z;

        END IF;

        RETURN vres;

    END IF;

    IF vdatatype = 'base' THEN

        IF valuetype = 'null' THEN

            vproxy := 'null'::JSONB;
        
        ELSE
        
            vproxy := TO_JSONB(pvalue);

        END IF;

    ELSE

        SELECT TO_JSONB(z)
        INTO vproxy
        FROM JSONB_POPULATE_RECORD
        (
            pvalue,
            TO_JSONB(pvalue)
        ) z;

    END IF;
        
    FOR i IN REVERSE CARDINALITY(pathParts)..3 LOOP

        vleaf := src #> pathParts[3:i-1];
        vres := JSONB_SET
        (
            CASE
                WHEN vleaf IS NOT NULL AND JSONB_TYPEOF(vleaf) = 'object' THEN
                    vleaf
                ELSE
                    '{}'::JSONB
                END,
            ARRAY[pathParts[i]],
            CASE
                WHEN i = CARDINALITY(pathParts) THEN
                    vproxy
                ELSE
                    vres
            END
        );

    END LOOP;

    RETURN src || vres;

END;
$BODY$;
