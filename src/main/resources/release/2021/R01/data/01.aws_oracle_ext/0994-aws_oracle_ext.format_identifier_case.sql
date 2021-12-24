CREATE OR REPLACE FUNCTION aws_oracle_ext.format_identifier_case
(
    IN TEXT
)
RETURNS TEXT AS
$BODY$
    SELECT
        CASE
            WHEN $1 LIKE '"%"' THEN
                SUBSTRING($1, 2, LENGTH($1) - 2)
            ELSE
                UPPER($1)
            END;
$BODY$
LANGUAGE SQL
IMMUTABLE
PARALLEL SAFE
RETURNS NULL ON NULL INPUT;