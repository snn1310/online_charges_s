comment on function aws_oracle_ext.get_ora_sqlcode( aws_oracle_ext.mapped_error_codes.ora_exception%type ) is $$
  Returns an appropriate Oracle error code for Oracle built-in exception.

  Parameters:
    ora_exception -- name of Oracle built-in exception
$$;