comment on function aws_oracle_ext.get_pg_sqlstate( aws_oracle_ext.mapped_error_codes.ora_code%type ) is $$
  Returns a mapped PostgreSQL error code for Oracle error code, if a mapping exists.

  Parameters:
    ora_code -- Oracle integer error code like those SQLCODE returns
$$;