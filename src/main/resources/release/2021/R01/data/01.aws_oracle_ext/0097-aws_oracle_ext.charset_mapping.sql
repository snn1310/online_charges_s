CREATE TABLE aws_oracle_ext.charset_mapping
(
  id BIGINT NOT NULL DEFAULT nextval('aws_oracle_ext.charset_mapping_id_seq'),
  oracle_charset character varying(64),
  oracle_description character varying(256),
  postgresql_charset character varying(64),
  postgresql_description character varying(64),
  postgresql_language character varying(64)
);

										


