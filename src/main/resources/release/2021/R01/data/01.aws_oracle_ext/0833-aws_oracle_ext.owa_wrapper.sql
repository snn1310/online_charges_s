CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_wrapper
(
    IN pRoutinePath TEXT,
    IN pParams JSON
)
RETURNS VOID AS
$BODY$
DECLARE
    vSchema TEXT;
    vRoutineName TEXT;
    vRarray TEXT[];
    vStatusCode SMALLINT DEFAULT 404;
    vStatusDescription TEXT;
    vRoutineExists SMALLINT DEFAULT 0;
    rec RECORD;
    vParamsPassed TEXT[];
    vParamsExpected TEXT[];
    vSQL TEXT;
    vDefaults JSONB;
    vArgs TEXT;
BEGIN

    vRarray := REGEXP_SPLIT_TO_ARRAY(pRoutinePath, '\.');

    IF ARRAY_LENGTH(vRarray, 1) = 1 THEN

        vSchema := CURRENT_SCHEMA();
        vRoutineName := vRarray[1];

    ELSE

        vSchema := vRarray[1];

        vRoutineName := ARRAY_TO_STRING(ARRAY_REMOVE(vRarray, vSchema), '');

    END IF;

    IF vSchema IS NOT NULL THEN

        SELECT COUNT(*)
        INTO vRoutineExists
        FROM pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        WHERE n.nspname = TRIM(LOWER(vSchema))
        AND p.proname = TRIM(LOWER(vRoutineName));

    END IF;

    IF vRoutineExists = 1 THEN

        SELECT COALESCE(
            ARRAY_AGG(V),
            ARRAY[]::TEXT[]
        )
        INTO vParamsPassed
        FROM JSON_OBJECT_KEYS(pParams) AS v;

        <<procsearch>>
        FOR rec IN
        (
            SElECT p.oid,
                p.proname,
                p.proargnames,
                p.pronargdefaults,
                p.proargtypes
            FROM pg_proc p
            JOIN pg_namespace n ON p.pronamespace = n.oid
            WHERE n.nspname = TRIM(LOWER(vSchema))
            AND p.proname = TRIM(LOWER(vRoutineName))
        )
        LOOP

            CASE
                
                WHEN rec.proargnames IS NULL AND vParamsPassed = ARRAY[]::TEXT[] THEN

                    vArgs := '';

                WHEN rec.pronargdefaults > 0 AND vParamsPassed <@ rec.proargnames AND rec.proargnames IS NOT NULL THEN

                    FOR i IN 1..ARRAY_LENGTH(rec.proargnames, 1) LOOP

                        IF NOT pParams::JSONB ? rec.proargnames[i]
                            AND PG_GET_FUNCTION_ARG_DEFAULT(rec.oid, i) IS NULL THEN

                            RAISE SQLSTATE '42883';

                        END IF;

                        vArgs := CONCAT(
                            vArgs,
                            rec.proargnames[i],
                            ' => ',
                            CASE
                                WHEN pParams::JSONB ? rec.proargnames[i] THEN
                                    CONCAT(
                                        CASE WHEN rec.proargtypes[i - 1] <> 701 AND LENGTH(COALESCE(pParams->rec.proargnames[i]->>0, '')) <> 0 THEN E'\'' ELSE '' END,
                                        CASE WHEN LENGTH(COALESCE(pParams->rec.proargnames[i]->>0, '')) = 0 THEN 'NULL' ELSE pParams->rec.proargnames[i]->>0 END,
                                        CASE WHEN rec.proargtypes[i - 1] <> 701 AND LENGTH(COALESCE(pParams->rec.proargnames[i]->>0, '')) <> 0 THEN E'\'' ELSE '' END,
                                        '::',
                                        CASE WHEN rec.proargtypes[i - 1] = 701 THEN 'DOUBLE PRECISION' ELSE 'TEXT' END      
                                    )
                                ELSE
                                    PG_GET_FUNCTION_ARG_DEFAULT(rec.oid, i)
                            END,
                            CASE WHEN i = ARRAY_LENGTH(rec.proargnames, 1) THEN '' ELSE ',' END
                        );

                    END LOOP;

                WHEN rec.pronargdefaults = 0 AND 
                    (JSONB_ARRAY_LENGTH(TO_JSONB(vParamsPassed)) = ARRAY_LENGTH(rec.proargnames, 1)) AND
                    TO_JSONB(vParamsPassed) ?& rec.proargnames THEN

                    FOR i IN 1..ARRAY_LENGTH(rec.proargnames, 1) LOOP

                        vArgs := CONCAT(
                            vArgs,
                            rec.proargnames[i],
                            ' => ',
                            CASE WHEN rec.proargtypes[i - 1] <> 701 THEN E'\'' ELSE '' END,
                            pParams->rec.proargnames[i]->>0,
                            CASE WHEN rec.proargtypes[i - 1] <> 701 THEN E'\'' ELSE '' END,
                            '::',
                            CASE WHEN rec.proargtypes[i - 1] = 701 THEN 'DOUBLE PRECISION' ELSE 'TEXT' END,
                            CASE WHEN i = ARRAY_LENGTH(rec.proargnames, 1) THEN '' ELSE ',' END
                        );

                    END LOOP;

                ELSE

                    CONTINUE procsearch;

            END CASE;

        END LOOP procsearch;

        IF vArgs IS NOT NULL THEN

            vSQL := CONCAT(
                'SELECT ',
                TRIM(LOWER(vSchema)),
                '.',
                TRIM(LOWER(vRoutineName)),
                '(',
                vArgs,
                ')'
            );

        END IF;

        IF vSQL IS NULL THEN

            RAISE SQLSTATE '42883';

        ELSE

            EXECUTE vSQL;

        END IF;

    ELSE
        
        RAISE SQLSTATE '42883';

    END IF;

EXCEPTION
    
    WHEN SQLSTATE '42883' THEN
        
        PERFORM aws_oracle_ext.owa_util$status_line(404);
        
END;
$BODY$
LANGUAGE plpgsql;