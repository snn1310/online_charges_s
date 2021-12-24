CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$nl
(
    IN cclear TEXT DEFAULT NULL,
    IN cattributes TEXT DEFAULT NULL
)
RETURNS TEXT AS
$BODY$

  SELECT aws_oracle_ext.htf$br(cclear, cattributes);

$BODY$
LANGUAGE SQL
IMMUTABLE;