CREATE OR REPLACE FUNCTION aws_oracle_ext.immutable_concat_ws(text, VARIADIC param_args text[])
RETURNS text AS
$$
SELECT array_to_string($2,$1);
$$
LANGUAGE 'sql'
IMMUTABLE;