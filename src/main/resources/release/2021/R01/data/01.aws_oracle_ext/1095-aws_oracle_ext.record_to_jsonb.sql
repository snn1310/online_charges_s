CREATE OR REPLACE FUNCTION aws_oracle_ext.record_to_jsonb
(
    IN ANYELEMENT
)
RETURNS JSONB
LANGUAGE SQL IMMUTABLE PARALLEL SAFE
AS
$BODY$
SELECT TO_JSONB(z)
        FROM JSONB_POPULATE_RECORD
        (
            $1,
            TO_JSONB($1)
        ) z;
$BODY$        