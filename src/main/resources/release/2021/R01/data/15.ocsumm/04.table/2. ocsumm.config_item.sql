CREATE TABLE ocsumm.config_item(
    ci_config_item CHARACTER VARYING(50) NOT NULL,
    ci_multivalued CHARACTER(1) NOT NULL,
    ci_description CHARACTER VARYING(100) NOT NULL,
    ci_modified_by CHARACTER VARYING(12) NOT NULL,
    ci_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm.config_item.ci_config_item
     IS 'Config item name.';
COMMENT ON COLUMN ocsumm.config_item.ci_multivalued
     IS 'Allow multiple config values.';
COMMENT ON COLUMN ocsumm.config_item.ci_description
     IS 'Description of the config item.';
COMMENT ON COLUMN ocsumm.config_item.ci_modified_by
     IS 'Last modified by.';
COMMENT ON COLUMN ocsumm.config_item.ci_mod_timestamp
     IS 'Timestamp of last modify.';

