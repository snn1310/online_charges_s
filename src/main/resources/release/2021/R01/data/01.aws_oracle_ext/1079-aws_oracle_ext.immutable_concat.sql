CREATE OR REPLACE FUNCTION aws_oracle_ext.immutable_concat(VARIADIC param_args text[])
RETURNS text AS
$$
SELECT array_to_string($1,'');
$$
LANGUAGE 'sql'
IMMUTABLE;