CREATE OR REPLACE FUNCTION aws_oracle_ext.get_user_oid_by_name(IN p_user_name NAME)
RETURNS BIGINT
AS $$
SELECT oid::BIGINT
  FROM pg_catalog.pg_roles
 WHERE rolname = p_user_name
$$
LANGUAGE SQL
RETURNS NULL ON NULL INPUT;