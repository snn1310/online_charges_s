CREATE OR REPLACE FUNCTION aws_oracle_ext.exists
(
    pcollection IN ANYARRAY,
    n IN INTEGER
)
RETURNS BOOLEAN
AS
$BODY$
    SELECT EXISTS 
    (
        SELECT
        FROM UNNEST(pcollection) WITH ORDINALITY AS t(v,o)
        WHERE o = n
    );
$BODY$
LANGUAGE SQL
IMMUTABLE;
