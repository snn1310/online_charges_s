comment on table aws_oracle_ext.mapped_error_codes is 'Error code mapping from Oracle built-in errors to PostgreSQL ones';
comment on column aws_oracle_ext.mapped_error_codes.ora_code is 'Oracle error code';
comment on column aws_oracle_ext.mapped_error_codes.ora_exception is 'Oracle predefined exception';
comment on column aws_oracle_ext.mapped_error_codes.ora_message is 'Oracle error message';
comment on column aws_oracle_ext.mapped_error_codes.pg_code is 'PostgreSQL error code';
comment on column aws_oracle_ext.mapped_error_codes.pg_exception is 'PostgreSQL predefined exception';
comment on column aws_oracle_ext.mapped_error_codes.pg_message is 'PostgreSQL error message';
comment on column aws_oracle_ext.mapped_error_codes.description is 'Optional description of error';
