CREATE TABLE aws_oracle_ext.service_settings
(
    service character varying(50) NOT NULL
    ,setting character varying(100) NOT NULL
    ,value character varying
);

comment on table aws_oracle_ext.service_settings is 'Settings for Extension Pack services';
comment on column aws_oracle_ext.service_settings.service is 'Service name';
comment on column aws_oracle_ext.service_settings.setting is 'Setting name';
comment on column aws_oracle_ext.service_settings.value is 'Setting value';