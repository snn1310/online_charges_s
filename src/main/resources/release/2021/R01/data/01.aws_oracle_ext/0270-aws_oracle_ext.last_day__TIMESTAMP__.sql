CREATE OR REPLACE FUNCTION aws_oracle_ext.last_day
(
    IN pDate TIMESTAMP WITHOUT TIME ZONE
)
RETURNS TIMESTAMP WITHOUT TIME ZONE
AS
$BODY$

    SELECT MAKE_TIMESTAMP
    (
        EXTRACT('YEAR' FROM pDate)::INT,
        EXTRACT('MONTH' FROM pDate)::INT,
        EXTRACT('DAY' FROM (DATE_TRUNC('MONTH', pDate) + '1MONTH'::INTERVAL - '1 DAY'::INTERVAL))::INT,
        EXTRACT('HOUR' FROM pDate)::INT,
        EXTRACT('MIN' FROM pDate)::INT,
        EXTRACT('SEC' FROM pDate)
    );

$BODY$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
