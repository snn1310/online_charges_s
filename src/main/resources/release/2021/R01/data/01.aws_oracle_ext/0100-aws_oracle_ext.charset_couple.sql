ALTER TABLE aws_oracle_ext.charset_mapping
    ADD CONSTRAINT charset_couple UNIQUE(oracle_charset, postgresql_charset);