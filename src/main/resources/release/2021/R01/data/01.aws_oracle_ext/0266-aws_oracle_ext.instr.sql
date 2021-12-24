CREATE OR REPLACE FUNCTION aws_oracle_ext.instr
(
    p_str TEXT,
    p_substr TEXT,
    p_pos NUMERIC DEFAULT 1,
    p_occurrence NUMERIC DEFAULT 1
)
RETURNS NUMERIC AS
$BODY$


    SELECT
        CASE

            WHEN LENGTH($1) = 0 OR LENGTH($2) = 0 THEN NULL::NUMERIC

            WHEN TRUNC($4) = 0 THEN 1/TRUNC($4)

            WHEN $4 < 0 THEN SQRT($4)

            ELSE

                (

                    WITH RECURSIVE t(str, shift, pos, tail, o, n) AS 
                    (
                        SELECT CASE WHEN TRUNC($3) < 0 THEN REVERSE($1) ELSE $1 END AS str,
                            0 AS shift,
                            CASE WHEN TRUNC($3) < 0 THEN -1 * TRUNC($3)::INT ELSE TRUNC($3)::INT END AS pos,
                            CASE WHEN TRUNC($3) < 0 THEN REVERSE($1) ELSE $1 END AS tail,
                            0 AS o,
                            CASE WHEN TRUNC($3) < 0 THEN REVERSE($2) ELSE $2 END AS n
                        UNION ALL
                        SELECT str,
                            shift + pos AS shift,
                            STRPOS(SUBSTR(str, shift + pos), n) AS pos,
                            SUBSTR(str, shift + pos) AS tail,
                            o + 1 AS o,
                            n
                        FROM t
                        WHERE pos <> 0
                    )
                    ,r AS
                    (
                        SELECT t.str,
                            t.shift,
                            t.pos,
                            t.tail,
                            t.o,
                            CASE
                                WHEN TRUNC($3) > 0 THEN
                                    t.pos + t.shift - 1
                                ELSE
                                    LENGTH(t.str) - t.pos - t.shift + 2
                            END cc
                        FROM t
                        WHERE t.o = TRUNC($4)
                        AND t.pos <> 0
                    )
                    SELECT COALESCE
                    (
                        (
                            SELECT r.cc
                            FROM r
                        ),
                        0
                    )::NUMERiC
                )

        END;

$BODY$
LANGUAGE SQL
IMMUTABLE
PARALLEL SAFE
RETURNS NULL ON NULL INPUT;