CREATE OR REPLACE FUNCTION aws_oracle_ext.asciistr
(
    p_str TEXT
)
RETURNS TEXT AS
$BODY$

    SELECT
        CASE
            WHEN p_str ='' THEN NULL::TEXT
            ELSE
                (
                    SELECT ARRAY_TO_STRING
                    (
                        ARRAY_AGG
                        (
                            CASE 
                                WHEN ASCII(v) <= 127 and ASCII(v) != 92 THEN
                                    v
                        ELSE
                            CONCAT
                            (
                                '\',
                                UPPER
                                (
                                    LPAD
                                    (
                                        TO_HEX(ASCII(v)),
                                        4,
                                        '0'
                                    )
                                )
                            )
                        END
                        ),
                        ''
                    )
                    FROM REGEXP_SPLIT_TO_TABLE(p_str, '') AS v
                )
        END;

$BODY$
LANGUAGE SQL
IMMUTABLE
PARALLEL SAFE 
RETURNS NULL ON NULL INPUT;