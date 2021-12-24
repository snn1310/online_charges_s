CREATE OR REPLACE FUNCTION aws_oracle_ext.from_tz
(
    timestamp_value TIMESTAMP WITHOUT TIME ZONE,
    time_zone_value CHARACTER VARYING(100)
)
RETURNS TIMESTAMP WITH TIME ZONE AS
$BODY$


    SELECT
        CASE

            WHEN LENGTH($2) = 0 THEN

                NULL::TIMESTAMP WITH TIME ZONE

            ELSE

                MAKE_TIMESTAMPTZ
                (
                    EXTRACT(YEAR FROM $1)::INTEGER,
                    EXTRACT(MONTH FROM $1)::INTEGER,
                    EXTRACT(DAY FROM $1)::INTEGER,
                    EXTRACT(HOUR FROM $1)::INTEGER,
                    EXTRACT(MIN FROM $1)::INTEGER,
                    EXTRACT(SEC FROM $1),
                    CONCAT
                    (
                        CASE WHEN $2 !~* '[\-\+]' THEN '+' ELSE '' END,
                        REPLACE($2, ' ', '')
                    )
                )

        END;


$BODY$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;