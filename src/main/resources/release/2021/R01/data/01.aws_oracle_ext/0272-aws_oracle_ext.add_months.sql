CREATE OR REPLACE FUNCTION aws_oracle_ext.add_months
(
    pdate TIMESTAMP WITHOUT TIME ZONE,
    pmonths INT
)
RETURNS TIMESTAMP WITHOUT TIME ZONE AS
$BODY$

    SELECT
        CASE
            WHEN aws_oracle_ext.last_day(pdate) <> pdate THEN
                pdate + MAKE_INTERVAL(months => pmonths)
            ELSE 
                aws_oracle_ext.last_day(pDate + MAKE_INTERVAL(months => pmonths))
    END;

$BODY$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;