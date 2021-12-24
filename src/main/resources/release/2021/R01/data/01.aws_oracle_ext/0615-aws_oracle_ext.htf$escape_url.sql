CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$escape_url
(
    p_url IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT replace(aws_oracle_ext.htf$escape_sc(p_url), '%', '%25');

$BODY$
LANGUAGE SQL
IMMUTABLE;

