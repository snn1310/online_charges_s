CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN DATE,
    pFmt      IN VARCHAR,
    pNlsParam IN VARCHAR DEFAULT NULL
)
RETURNS VARCHAR
AS
$BODY$
    SELECT aws_oracle_ext.to_char
    (
        $1::TIMESTAMP(0),
        $2,
        $3
    );
$BODY$
LANGUAGE SQL;