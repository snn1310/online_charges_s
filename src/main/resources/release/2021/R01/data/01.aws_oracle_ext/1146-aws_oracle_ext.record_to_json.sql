CREATE OR REPLACE FUNCTION aws_oracle_ext.record_to_json
(
    IN ANYELEMENT
)
RETURNS JSON
LANGUAGE SQL IMMUTABLE PARALLEL SAFE
AS
$BODY$
SELECT ROW_TO_JSON(z.*)
        FROM JSON_POPULATE_RECORD
        (
            $1,
            TO_JSON($1)
        ) z;
$BODY$        