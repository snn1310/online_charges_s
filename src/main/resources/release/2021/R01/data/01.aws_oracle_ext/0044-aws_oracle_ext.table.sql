CREATE OR REPLACE FUNCTION aws_oracle_ext.table
(
    pVal IN anyelement,
    pValType IN VARCHAR,
    pTypeToCast IN VARCHAR DEFAULT NULL,
    pIndexes IN BIGINT[] DEFAULT NULL
)
RETURNS SETOF RECORD
AS
$BODY$
DECLARE
    vSQL TEXT;
    vcol TEXT;
    vcolumns TEXT[];
    vpos SMALLINT DEFAULT 0;
BEGIN

    CASE
        WHEN pValType = 'NESTED' THEN

            IF pIndexes IS NOT NULL THEN

                vSQL := CONCAT
                (
                    'SELECT CAST(ROW(src.v) AS ',
                    pTypeToCast,
                    ')',
                    CHR(10),
                    'FROM UNNEST($1) WITH ORDINALITY AS src(v, rownum)',
                    CHR(10),
                    'JOIN UNNEST($2) WITH ORDINALITY AS lim(v, rownum) ON src.rownum = lim.v',
                    CHR(10),
                    'ORDER BY lim.rownum'
                );

                RETURN QUERY EXECUTE vSQL USING pVal, pIndexes;
            
            ELSE

                vSQL := CONCAT('SELECT CAST(ROW(v) AS ', pTypeToCast, ') FROM UNNEST($1) WITH ORDINALITY AS v');
                RETURN QUERY EXECUTE vSQL USING pVal;

            END IF;
                        
        WHEN pValType = 'NESTEDREC' THEN

            vSQL := CONCAT
            (
                'SELECT ARRAY(SELECT JSON_OBJECT_KEYS(ROW_TO_JSON(s)) FROM ',
                '(',
                'SELECT (NULL::',
                pTypeToCast,
                ').*',
                ') AS s)'
            );

            EXECUTE vSQL INTO vcolumns;

            vSQL := '';

            vpos := CARDINALITY(vcolumns);

            FOREACH vcol IN ARRAY vcolumns LOOP

                vpos := vpos - 1;

                vSQL := CONCAT
                (
                    vSQL,
                    'src.',
                    vcol,
                    CASE WHEN vpos <> 0  THEN ', ' ELSE '' END
                );

            END LOOP;

            IF pIndexes IS NOT NULL THEN

                vSQL := CONCAT
                (
                    'SELECT ROW(',
                    vSQL,
                    ')::',
                    pTypeToCast,
                    ' FROM UNNEST($1) WITH ORDINALITY AS src JOIN UNNEST($2) WITH ORDINALITY AS lim(v, rownum) ON src.ordinality = lim.v ORDER BY lim.rownum'
                );

                RETURN QUERY EXECUTE vSQL USING pVal, pIndexes;

            ELSE

                vSQL := CONCAT
                (
                    'SELECT ROW(',
                    vSQL,
                    ')::',
                    pTypeToCast,
                    ' FROM UNNEST($1) WITH ORDINALITY AS src'
                );

                RETURN QUERY EXECUTE vSQL USING pVal;

            END IF;

        WHEN pValType = 'ASSOC' THEN

            IF PG_TYPEOF(pVal)::TEXT <> 'jsonb' THEN

                RAISE USING MESSAGE := 'Associative array is incorrect. Please, specify procedure name and array path';

            END IF;

            vSQL := FORMAT
            (
                $$
SELECT JSONB_POPULATE_RECORD(null::%s, z.*)
FROM aws_oracle_ext.collection_to_table
(
    p_val => $1,
    pindexes => $2
) AS z
                $$,
                pTypeToCast
            );

            RETURN QUERY EXECUTE vSQL USING pVal, pindexes;

        ELSE
            NULL;
    END CASE;

END;
$BODY$
LANGUAGE plpgsql;
