CREATE OR REPLACE FUNCTION aws_oracle_ext.months_between
(
    enddate1 TIMESTAMP WITHOUT TIME ZONE,
    startdate2 TIMESTAMP WITHOUT TIME ZONE
)
RETURNS NUMERIC AS
$BODY$

SELECT
    CASE
        WHEN DATE_TRUNC('DAY', $1) = DATE_TRUNC('DAY', $2) THEN
        
            0::NUMERIC

        WHEN EXTRACT(DAY FROM $1) = EXTRACT(DAY FROM $2) THEN

            ROUND
            (
                EXTRACT(YEARS FROM AGE($1, $2)) * 12 +
                EXTRACT(MONTHS FROM AGE($1, $2))  +
                EXTRACT(DAYS FROM AGE($1, $2)) /31 +
                EXTRACT(HOURS FROM AGE($1, $2)) /31 /24 +
                EXTRACT(SECONDS FROM AGE($1, $2)) /86400 /31
            )::NUMERIC

        WHEN DATE_TRUNC('DAY', aws_oracle_ext.last_day($1)) = DATE_TRUNC('DAY', $1) AND
            DATE_TRUNC('DAY', aws_oracle_ext.last_day($2)) = DATE_TRUNC('DAY', $2) THEN

            FLOOR
            (
                EXTRACT(YEARS FROM AGE($1, $2)) * 12 +
                EXTRACT(MONTHS FROM AGE($1, $2))  +
                EXTRACT(DAYS FROM AGE($1, $2)) /31 +
                EXTRACT(HOURS FROM AGE($1, $2)) /31 /24 +
                EXTRACT(SECONDS FROM AGE($1, $2)) /86400 /31
            )::NUMERIC

        ELSE

            (
                EXTRACT(YEARS FROM AGE($1, $2)) * 12 +
                EXTRACT(MONTHS FROM AGE($1, $2))  +
                EXTRACT(DAYS FROM AGE($1, $2)) /31 +
                EXTRACT(HOURS FROM AGE($1, $2)) /31 /24 +
                EXTRACT(SECONDS FROM AGE($1, $2)) /86400 /31
            )::NUMERIC

    END;

$BODY$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;